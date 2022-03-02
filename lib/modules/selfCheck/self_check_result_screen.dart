import 'package:flutter/material.dart';
import 'package:hawwah/layout/home_layout.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/components/components.dart';

class SelfCheckResultScreen extends StatelessWidget {
  const SelfCheckResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: primaryColor,
        centerTitle: true,
        title: const Text(
            "*(نتيجة الاختبار)*",
          style: TextStyle(
              color: Colors.pink,
              fontSize: 30.0,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Stack(
        children:  [
          const Center(
            child: const Image(
                image: AssetImage(
                    "assets/images/selfCheckResult.png",
                ),),
          ),
          Center(
              child: const Text(
                  "اذا استمرت هذه الأعراض \n  لمده اسبوعين يجب التوجه\n الى اقرب طبيب متخصص",
                style: TextStyle(
                  color: Colors.pink,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold
                ),
              ),
          ),
          Positioned(
            bottom: 40.0,
            right: 100,
            child: GestureDetector(
            child: Container(
              width: 200.0,
              height: 50,
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: const Center(
                  child: Text(
                    "تــم",
                    style: TextStyle(fontSize: 30.0, color: Colors.pink),
                  )),
            ),
            onTap: () {
              navigateToAndFinish(context, HomeLayout());
            },
          ),)


        ],
      ),
    );
  }
}
