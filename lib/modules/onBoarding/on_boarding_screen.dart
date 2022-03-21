
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/components/components.dart';
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
      image: 'assets/images/onboarding/onboarding1.svg',
      title: 'مرحبا بكم',
      body: 'هدفنا هو التوعية والحفاظ على صحة المرأة فى المقام الأول',
    ),
    Model(
      image: 'assets/images/onboarding/onboarding2.svg',
      title: 'مرحبا بكم',
      body: 'هدفنا هو التوعية والحفاظ على صحة المرأة فى المقام الأول',
    ),
    Model(
      image: 'assets/images/onboarding/onboarding3.svg',
      title: 'مرحبا بكم',
      body:
      'هدفنا هو التوعية والحفاظ على صحة المرأة فى المقام الأول',
    ),
    Model(
      image: 'assets/images/onboarding/onboarding4.svg',
      title: 'مرحبا بكم',
      body:
      'هدفنا هو التوعية والحفاظ على صحة المرأة فى المقام الأول',
    ),
    Model(
        image: "assets/images/onboarding/onboarding5.svg",
        title: "مرحبا بكم",
        body: 'هدفنا هو التوعية والحفاظ على صحة المرأة فى المقام الأول',),
    Model(
        image: "assets/images/onboarding/onboarding6.svg",
        title: "مرحبا بكم",
        body: 'هدفنا هو التوعية والحفاظ على صحة المرأة فى المقام الأول',),
  ];

  var pageController = PageController();

  bool isLast = false;

  // void submit(){
  //
  //   CacheHelper.saveData(key: "onBoarding", value: true).then((value) {
  //     if(value){
  //       navigateToAndFinish(
  //         context,
  //         LoginScreen(),
  //       );
  //     }
  //   });
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          TextButton(
              onPressed: (){
               // submit();
                navigateToAndFinish(context, HomeLayout());
              },
              child: Text(
                "تخــطى",
                style: TextStyle(
                    color: Colors.pink[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),))
        ],
      ),
      body: Padding(
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
                       //submit();
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
    );
  }

  Widget buildBoarderItem(Model pages) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child:SvgPicture.asset(
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
