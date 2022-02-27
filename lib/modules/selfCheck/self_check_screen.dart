import 'package:flutter/material.dart';
import 'package:hawwah/layout/home_layout.dart';
import 'package:hawwah/modules/selfCheck/self_check_steps.dart';
import 'package:hawwah/shared/components/components.dart';

import '../../shared/components/colors.dart';

class SelfCheckScreen extends StatefulWidget {
  const SelfCheckScreen({Key? key}) : super(key: key);
  @override
  _SelfCheckScreenState createState() => _SelfCheckScreenState();
}

class _SelfCheckScreenState extends State<SelfCheckScreen> {
  List<Widget> pages=[
    FirstSteps(),
    SecondSteps(),
  ];


  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
              itemBuilder: (context, index) => pages[index],
              itemCount: pages.length,
              controller: pageController,
            ),
          ),
          // Center(
          //   child: GestureDetector(
          //     child: Container(
          //       width: 150.0,
          //       height: 50.0,
          //       decoration: BoxDecoration(
          //         color: primaryColor,
          //         borderRadius: BorderRadius.circular(15.0),
          //       ),
          //       child: const Center(
          //           child: Text(
          //             "التــالى",
          //             style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold, color: Colors.white),
          //           )),
          //     ),
          //     onTap: () {
          //       if(isLast) {
          //         //submit();
          //         navigateToAndFinish(context, HomeLayout());
          //       } else {
          //         pageController.nextPage(
          //             duration: Duration(milliseconds: 750),
          //             curve: Curves.fastLinearToSlowEaseIn);
          //       };
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
