import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialmedia/firebase_options.dart';
import 'package:socialmedia/layout/Home.dart';
import 'package:socialmedia/layout/social_cubit.dart';
import 'package:socialmedia/layout/social_state.dart';
import 'package:socialmedia/modules/Auth/login.dart';
import 'package:socialmedia/shared/components/constant.dart';
import 'package:socialmedia/shared/network/dio_helper.dart';

import 'shared/network/local/cash_helper.dart';
import 'shared/style/bloc_observer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  Widget widget;
    uId = CacheHelper.getData2(key: 'uId');
  if(uId == 'false'){
    widget = SocialLoginScreen();
  }else{
    widget = HomeScreen();
  }
  runApp(MyApp(widget));
}

class MyApp extends StatelessWidget {
  final Widget widget;
  const MyApp(this.widget);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SocialCubit()..getUserData()),
    ],
        child: BlocConsumer<SocialCubit,SocialState>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Social Media',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
                useMaterial3: true,
              ),
              home: widget ,
            );
          },

        ),
    );
  }
}

