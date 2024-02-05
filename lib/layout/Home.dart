import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialmedia/layout/social_cubit.dart';
import 'package:socialmedia/layout/social_state.dart';
import 'package:socialmedia/modules/Auth/login.dart';
import 'package:socialmedia/shared/components/components.dart';
import 'package:socialmedia/shared/components/constant.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SocialCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(cubit.title[cubit.currentIndex] ,style: TextStyle(fontWeight: FontWeight.bold)),
            actions: [
              IconButton(onPressed: () {
              }, icon: Icon(Icons.notifications)),

              IconButton(onPressed: () {
              }, icon: Icon(Icons.search)),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: cubit.currentIndex,
          onTap: (index){
            cubit.changeBottomNav(index);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon( Icons.home),label: "Home"),
            BottomNavigationBarItem(icon: Icon( Icons.chat),label: "Chat"),
            BottomNavigationBarItem(icon: Icon( Icons.location_history),label: "Users"),
            BottomNavigationBarItem(icon: Icon( Icons.settings),label: "Settings"),
          ]
        ),

        );
      },
    );
  }
}
