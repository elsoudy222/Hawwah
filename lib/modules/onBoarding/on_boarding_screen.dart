
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hawwah/modules/login/login_screen.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/components/components.dart';
import 'package:hawwah/shared/network/local/cache_helper.dart';
import '../../layout/home_layout.dart';
import 'model.dart';
import "package:smooth_page_indicator/smooth_page_indicator.dart";

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<Model> pages = [
    Model(
      image: 'assets/images/onboarding/onboarding1.png',
      title: 'مرحبا بكم',
      body: 'هدفنا هو التوعية والحفاظ على صحة المرأة فى المقام الأول',
    ),
    Model(
      image: 'assets/images/onboarding/onboarding2.png',
      title: 'الكشف المبكر ',
      body: 'اجراء الفحوصات الطبيه مبكرا قادرة على انقاذ حياتك واحتواء المرض ان وجد ',
    ),
    Model(
      image: 'assets/images/onboarding/onboarding3.png',
      title: 'انتى مش لوحدك',
      body:
      'انتى اهم فرد فى المجتمع صحتك تهمنا كلنا معاكى ',
    ),
    Model(
      image: 'assets/images/onboarding/onboarding4.png',
      title: 'الفحص الذاتى ',
      body:
      'من الخطوات المهمه اللى ممكن تعمليها فى البيت للتأكد من عدم وجود تكتلات او أورام',
    ),
    Model(
        image: "assets/images/onboarding/onboarding5.png",
        title: "انتـى فد التحدى",
        body: 'متيأسيش لانك اقوى من اى مرض انتى قد التحدى ',),
    Model(
        image: "assets/images/onboarding/onboarding6.png",
        title: "التوعيه مهمه",
        body: 'لازم الكل يعرف اهميه التوعيه لأنها ممكن تنقذ حياة شخص اخر',),
  ];

  var pageController = PageController();

  bool isLast = false;

  void submit() {
    CacheHelper.saveData(
      key: 'onBoarding',
      value: true,
    ).then((value) {
      if (value) {
        navigateToAndFinish(
          context,
          LoginScreen(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(248, 157, 185, 1.0),
        elevation: 0.0,
        actions: [
          TextButton(
              onPressed: (){
               submit();
              },
              child: const Text(
                "تخــطى",
                style: TextStyle(
                    color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),))
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(248, 157, 185, 1.0),
                Color.fromRGBO(250, 250, 250, 1.0)
              ]),
        ),
        child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (int index) {
                      if (index == pages.length - 1) {
                        setState(() {
                          isLast = true;
                        });
                      } else {
                        setState(() {
                          isLast = false;
                        });
                      }
                    },
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        buildBoarderItem(pages[index]),
                    itemCount: pages.length,
                    controller: pageController,
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Row(
                  children: [
                    SmoothPageIndicator(
                      controller: pageController,
                      count: pages.length,
                      effect: ExpandingDotsEffect(
                          dotColor: secondaryColor,
                          dotHeight: 10,
                          expansionFactor:4,
                          dotWidth: 10,
                        activeDotColor: Colors.pink,
                      ),

                    ),
                    Spacer(),
                    FloatingActionButton(
                      backgroundColor: Colors.pink[700],
                      onPressed: () {
                        if(isLast) {
                         submit();
                        } else {
                          pageController.nextPage(
                              duration: Duration(milliseconds: 750),
                              curve: Curves.fastLinearToSlowEaseIn);
                        }

                      },
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }

  Widget buildBoarderItem(Model pages) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Image.asset(
              '${pages.image}',
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "${pages.title}",
            style: TextStyle(
              fontSize: 30,
           fontWeight: FontWeight.bold,
           color: Colors.pink[700]
           //   fontFamily: "MyFlutterApp",
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "${pages.body}",
            style: TextStyle(
              fontSize: 20,
                color: Colors.pink
             // fontFamily: "MyFlutterApp",
            ),
          )
        ],
      );
}
