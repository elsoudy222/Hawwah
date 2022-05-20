import 'package:flutter/material.dart';
import 'package:hawwah/layout/home_layout.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/components/components.dart';

class RiskResultScreen extends StatefulWidget {
  final result1;
  final result2;
  final result3;
  final result4;

  const RiskResultScreen({
    Key? key,
    required this.result1,
    required this.result2,
    required this.result3,
    required this.result4,
  }) : super(key: key);

  @override
  State<RiskResultScreen> createState() => _RiskResultScreenState();
}

class _RiskResultScreenState extends State<RiskResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("نســبة الإصابة"),
        backgroundColor: primaryColor,
        elevation: 0.0,
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
        child: Stack(
          children: [
            // const Center(
            //   child: Image(
            //     image: AssetImage(
            //       "assets/images/selfCheckResult.png",
            //     ),
            //   ),
            // ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ' نسبه الاصابه الخاصه بك علي مدار خمس اعوام : ',
                    style: TextStyle(
                        color: thirdColor,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${widget.result1 * 100} %',
                    style: TextStyle(
                        color: thirdColor,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),

                  Text(
                    'نسبه الاصابه لمن يشبهك علي مدار ٥ اعوام : ',
                    style: TextStyle(
                        color: thirdColor,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${widget.result2 * 100} %',
                    style: TextStyle(
                        color: thirdColor,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),


                  Text(
                    'نسبه الاصابه لمن يشبهك مدي الحياه : ',
                    style: TextStyle(
                        color: thirdColor,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${widget.result3 * 100} %',
                    style: TextStyle(
                        color: thirdColor,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),


                  Text(
                    'نسبه الاصابه الخاصه بك علي مدار الحياه : ',
                    style: TextStyle(
                        color: thirdColor,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${widget.result4 * 100} %',
                    style: TextStyle(
                        color: thirdColor,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
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
                  child: Center(
                      child: Text(
                    "تــم",
                    style: TextStyle(fontSize: 30.0, color: thirdColor),
                  )),
                ),
                onTap: () {
                  navigateToAndFinish(context, HomeLayout());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
