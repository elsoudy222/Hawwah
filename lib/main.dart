import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hawwah/layout/cubit/home_cubit.dart';
import 'package:hawwah/layout/home_layout.dart';
import 'package:hawwah/modules/changePassword/change_password_screen.dart';
import 'package:hawwah/modules/login/login_screen.dart';
import 'package:hawwah/modules/profile/profile_screen.dart';
import 'package:hawwah/shared/components/themes.dart';
import 'modules/onBoarding/on_boarding_screen.dart';

// TODO: Complete Editing on PredictionResultScreen [ DONE ]
// TODO: Edit Calender Screen [ DONE ]
// TODO: Edit Profile Screen []
// TODO: Complete Risk Calculator Screen [ DONE ]
// TODO: Complete Search Screen [ DONE ]
// TODO: Edit SelfCheck Screen [ DONE ]

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            //title: 'Flutter Demo',
            theme: lightMode,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('ar', 'AE'),
            ],
            home: HomeLayout(),
          );
        },
      ),
    );
  }
}


