import 'package:flutter/material.dart';
import 'package:hawwah/modules/selfCheck/self_check_steps.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:splash_screen_view/SplashScreenView.dart';




class IntroSelfCheckScreen extends StatelessWidget {
  const IntroSelfCheckScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      backgroundColor: HexColor("#FAACC3"),
      duration: 6000,
      speed: 200,
      navigateRoute: SelfCheckScreen(),
      imageSrc: "assets/images/logo.png",
      imageSize: 200,
      text: "اختــبار الفحص الذاتى",
      textStyle: const TextStyle(
          color: Colors.pink,
          fontSize: 40.0
      ),
    );
  }
}
class SelfCheckScreen extends StatefulWidget {
  const SelfCheckScreen({Key? key}) : super(key: key);
  @override
  _SelfCheckScreenState createState() => _SelfCheckScreenState();
}

class _SelfCheckScreenState extends State<SelfCheckScreen> {
  PageController? pageController;
  List<Widget> pages=[
    FirstSteps(),
    const SecondSteps(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FirstSteps(),
    );
  }
}



/*
Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => pages[index],
              itemCount: pages.length,
              controller: pageController,
              scrollDirection: Axis.horizontal,
              reverse: false,

            ),
          ),
 */