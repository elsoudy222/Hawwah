import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hawwah/layout/cubit/home_cubit.dart';
import 'package:hawwah/layout/home_layout.dart';
import 'package:hawwah/modules/login/login_screen.dart';
import 'package:hawwah/modules/onBoarding/on_boarding_screen.dart';
import 'package:hawwah/modules/riskCalculator/risk_calculator_screen.dart';
import 'package:hawwah/modules/splash/splash_screen.dart';
import 'package:hawwah/shared/components/themes.dart';
import 'modules/calender/calender_screen.dart';
import 'modules/changePassword/change_password_screen.dart';
import 'modules/profile/profile_screen.dart';
import 'modules/signUp/sign_up_screen.dart';

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
            home: ChangePassword(),
          );
        },
      ),
    );
  }
}


// TODO: Complete Editing on PredictionResultScreen
// TODO: