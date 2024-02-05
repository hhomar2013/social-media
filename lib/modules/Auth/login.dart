import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialmedia/layout/Home.dart';
import 'package:socialmedia/modules/Auth/bloc/login_cubit.dart';
import 'package:socialmedia/modules/Auth/bloc/login_state.dart';
import 'package:socialmedia/modules/Auth/register.dart';
import 'package:socialmedia/shared/components/components.dart';
import 'package:socialmedia/shared/network/local/cash_helper.dart';

class SocialLoginScreen extends StatelessWidget{
  var formKey =  GlobalKey<FormState>();
  var  emailController  = TextEditingController();
  var  passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialLoginCubit(),
      child: BlocConsumer<SocialLoginCubit,SocialLoginState>(
        listener: (context , state)  {
          // FirebaseAuth.instance.authStateChanges()
          //     .listen((User? user) {
          //   if (user != null) {
          //    navigateTo(context, HomeScreen());
          //   }else{
          //
          //   }
          // });
        if(state is SocialLoginErrorState){
          print('error');
        }
          if(state is SocialLoginSuccessState){
            CacheHelper.saveData(
                key: 'uId',
                value: state.uId,
            ).then((value) {
              navigateTo(context, HomeScreen());
            });
          }
        } ,
        builder: (context ,  state){
          return Scaffold(
            resizeToAvoidBottomInset: false,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              elevation: 0,
              title:  Center(
                child: Text('Social Media',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )),
              ),
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(height: 5,),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'email address must not be empty';
                            }
                            return null;
                          },
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            isDense: false,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                15.0,
                              ),
                            ),
                            label: const Text(
                              'email address',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'password is too short';
                            }
                            return null;
                          },
                          controller: passwordController,
                          decoration: InputDecoration(
                            isDense: false,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20.0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                15.0,
                              ),
                            ),
                            label: const Text(
                              'password',
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                /*setState(() {
                                    isVisible = !isVisible;
                                  });*/
                                SocialLoginCubit.get(context).changePasswordVisibility();
                              },
                              icon: Icon(
                                SocialLoginCubit.get(context).suffix,
                                //isVisible ? Icons.visibility : Icons.visibility_off,
                              ),
                            ),
                          ),
                          // obscureText: isVisible,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        Container(
                          height: 42 ,
                          width: double.infinity,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: MaterialButton(
                            onPressed: (){
                              if (formKey.currentState!.validate()){
                                SocialLoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            child: Text('Login',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an Account"),
                            TextButton(
                                onPressed: (){
                                  navigateTo(context,
                                      RegisterScreen());
                                },
                                child: Text(
                                    'Register'
                                )
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),

          );
        },
      ),
    );
  }

}