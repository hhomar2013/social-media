import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialmedia/layout/Home.dart';
import 'package:socialmedia/modules/Auth/bloc/register_cubit.dart';
import 'package:socialmedia/modules/Auth/bloc/register_state.dart';
import 'package:socialmedia/shared/components/components.dart';
import 'package:socialmedia/shared/components/constant.dart';
class RegisterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SocialRegisterCubit(),
        child: BlocConsumer<SocialRegisterCubit,SocialRegisterState>(
          listener: (context, state) {
            if(state is SocialCreateUserSuccessful){
              navigateTo(context, HomeScreen());
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(
                              'REGISTER',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 60,
                              color: Colors.black
                            ),
                          ),
                          Text(
                            'Create a New Account',
                            style:  TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                              color: Colors.grey
                            ),
                          ),
                           SizedBox(height: 45,),
                          Container(
                            child: TextFormField(
                              controller: emailController,
                              validator: (value){
                                return value!.isEmpty ? 'Required' : null ;
                              },
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 28,
                                  vertical: 18
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                suffix: Icon(Icons.email),
                                suffixStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.red,
                                ),
                                labelText: 'Email Address',
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(
                                    color: Colors.transparent
                                  ),
                                ),
                                enabledBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(
                                      color: Colors.transparent
                                  ),
                                ),
                                focusedBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(
                                      color: Colors.teal,
                                      width: 2.2,
                                  ),
                                ),
                                errorStyle: TextStyle(
                                  color:  Colors.red,
                                ),
                                hintText: 'Email Address',
                                hintStyle: TextStyle(
                                  fontSize: 19,
                                  fontWeight:  FontWeight.w600,
                                ),
                                prefixIcon: Icon(Icons.email_outlined),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  gapPadding: 10,
                                ),
                              ),

                            ),
                          ),
                          const SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: nameController,
                              validator: (value){
                                return value!.isEmpty ? 'Required' : null ;
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 28,
                                    vertical: 18
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                suffix: Icon(Icons.man_outlined),
                                suffixStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.red,
                                ),
                                labelText: 'Name',
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(
                                      color: Colors.transparent
                                  ),
                                ),
                                enabledBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(
                                      color: Colors.transparent
                                  ),
                                ),
                                focusedBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(
                                    color: Colors.teal,
                                    width: 2.2,
                                  ),
                                ),
                                errorStyle: TextStyle(
                                  color:  Colors.red,
                                ),
                                hintText: 'name',
                                hintStyle: TextStyle(
                                  fontSize: 19,
                                  fontWeight:  FontWeight.w600,
                                ),
                                prefixIcon: Icon(Icons.man),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  gapPadding: 10,
                                ),
                              ),

                            ),
                          ),
                          const SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: passwordController,
                              validator: (value){
                                return value!.isEmpty ? 'Required' : null ;
                              },
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 28,
                                    vertical: 18
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                suffix: Icon(Icons.lock_open),
                                suffixStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.red,
                                ),
                                labelText: 'Password',
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(
                                      color: Colors.transparent
                                  ),
                                ),
                                enabledBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(
                                      color: Colors.transparent
                                  ),
                                ),
                                focusedBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(
                                    color: Colors.teal,
                                    width: 2.2,
                                  ),
                                ),
                                errorStyle: TextStyle(
                                  color:  Colors.red,
                                ),
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                  fontSize: 19,
                                  fontWeight:  FontWeight.w600,
                                ),
                                prefixIcon: Icon(Icons.lock),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  gapPadding: 10,
                                ),
                              ),

                            ),
                          ),
                          const SizedBox(height: 10,),
                          Container(
                            child: TextFormField(
                              controller: phoneController,
                              validator: (value){
                                return value!.isEmpty ? 'Required' : null ;
                              },
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 28,
                                    vertical: 18
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                suffix: Icon(Icons.phone_enabled_sharp),
                                suffixStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.red,
                                ),
                                labelText: 'Phone',
                                disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(
                                      color: Colors.transparent
                                  ),
                                ),
                                enabledBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(
                                      color: Colors.transparent
                                  ),
                                ),
                                focusedBorder:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  borderSide: BorderSide(
                                    color: Colors.teal,
                                    width: 2.2,
                                  ),
                                ),
                                errorStyle: TextStyle(
                                  color:  Colors.red,
                                ),
                                hintText: 'Phone',
                                hintStyle: TextStyle(
                                  fontSize: 19,
                                  fontWeight:  FontWeight.w600,
                                ),
                                prefixIcon: Icon(Icons.phone),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                  gapPadding: 10,
                                ),
                              ),

                            ),
                          ),
                          const SizedBox(height: 10,),
                          ConditionalBuilder(
                              condition: state is! SocialRegisterLoadingState,
                              builder: (context) => Container(
                                  height: 40,
                                  width: double.maxFinite,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                    color: Colors.teal,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                child: MaterialButton(
                                  onPressed: (){
                                    if(formKey.currentState!.validate()){
                                      SocialRegisterCubit.get(context).userRegister(
                                          name: nameController.text,
                                          email: emailController.text,
                                          password: passwordController.text,
                                          phone: phoneController.text
                                      );
                                    }
                                  },
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              fallback: (context) => Center(child: CircularProgressIndicator()),),
                        ],
                      ),
                    ),
                  )
                ),
              ),
            );
          },
        ),
    );
  }
}
