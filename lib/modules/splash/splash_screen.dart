import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:hexcolor/hexcolor.dart';

import '../login/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      backgroundColor: HexColor("#FAACC3"),
      duration: 6000,
      speed: 200,
      navigateRoute: LoginScreen(),
      imageSrc: "assets/images/logo.png",
      imageSize: 300,
      text: "حَوَّاء ",
      textStyle: const TextStyle(
          color: Colors.pink,
          fontSize: 50.0
      ),
    );
  }
}