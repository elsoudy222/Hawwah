

import 'package:flutter/material.dart';
import 'package:hawwah/layout/home_layout.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/components/components.dart';

class RiskResultScreen extends StatefulWidget {
  final result;
  const RiskResultScreen({Key? key, required this.result}) : super(key: key);

  @override
  State<RiskResultScreen> createState() => _RiskResultScreenState();
}

class _RiskResultScreenState extends State<RiskResultScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("نســبة الإصابة"),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Stack(
        children:  [
          const Center(
            child:  Image(
              height: 500,
              width: 500.0,
              image: AssetImage(
                "assets/images/selfCheckResult.png",
              ),),
          ),
           Center(
            child: Text(
              '${widget.result*100} %',
              style: const TextStyle(
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
                navigateToAndFinish(context, const HomeLayout());
              },
            ),
          )
        ],
      ),
    );
  }
}
