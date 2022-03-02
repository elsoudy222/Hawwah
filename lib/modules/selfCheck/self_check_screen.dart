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
  PageController? pageController;
  List<Widget> pages=[
    FirstSteps(),
    SecondSteps(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => pages[index],
              itemCount: pages.length,
              controller: pageController,
            ),
          ),
        ],
      ),
    );
  }
}
