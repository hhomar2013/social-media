import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialmedia/layout/social_state.dart';
import 'package:socialmedia/modules/chats.dart';
import 'package:socialmedia/modules/feeds.dart';
import 'package:socialmedia/modules/settings.dart';
import 'package:socialmedia/modules/social_user.dart';
import 'package:socialmedia/modules/users.dart';
import 'package:socialmedia/shared/components/constant.dart';

class SocialCubit extends Cubit<SocialState>{
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [
    FeedScreen(),
    ChatScreen(),
    UsersScreen(),
    SettingScreen(),
  ];

  List<String> title = [
    'Home',
    'Chats',
    'Users',
    'Settings'
  ];

  void changeBottomNav(int index){
    currentIndex = index;
    emit(SocialChangeBottomNav());
  }

 late SocialUserModel model ;
  void getUserData(){
      FirebaseFirestore
          .instance
          .collection('123')
          .doc(uId)
          .get()
          .then((value){
          print(value.data());
          model = SocialUserModel.formJson(value.data());
          emit(SocialGetUserSuccessState());
      }).catchError((error){
        emit(SocialGetUserErrorState(error.toString()));
      });
  }
}

