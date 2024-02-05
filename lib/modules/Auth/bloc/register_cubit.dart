import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialmedia/modules/Auth/bloc/register_state.dart';
import 'package:socialmedia/modules/social_user.dart';
import 'package:socialmedia/shared/components/constant.dart';

class SocialRegisterCubit extends Cubit<SocialRegisterState>{
  SocialRegisterCubit() : super(SocialRegisterInitialState());

  static SocialRegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
      required String name,
      required String email,
      required String password,
      required String phone,
  }){
    emit(SocialRegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, password: password
    ).then((value) {
      userCreate(
        uId: value.user!.uid,
        phone: phone,
        email: email,
        name: name,
        password: password,
      );
      emit(SocialRegisterSuccessState());
      nameController.text = '';
      emailController.text = '';
      passwordController.text = '';
      phoneController.text = '';
    }).catchError((error){
      emit(SocialRegisterErrorState(error));
    });
  }


  void userCreate({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String uId,
}){
    SocialUserModel model = SocialUserModel(
        name: name,
        email: email,
        phone: phone,
        uId: uId,
        isEmailVerified:  false,
    );
  FirebaseFirestore
      .instance
      .collection('users')
      .doc(uId)
      .set(model.toMap()).then((value) {
        emit(SocialCreateUserSuccessful());
      }).catchError((error){
        emit(SocialCreateUserError(error.toString()));
      });
}

  IconData suffix = Icons.visibility_off_outlined;
  bool isPassword = true;

  void changePasswordVisibility(){
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(SocialChangePasswordVisibilityState());
  }

}