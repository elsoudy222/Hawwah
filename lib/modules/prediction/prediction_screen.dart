
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/components/components.dart';

class PredictionScreen extends StatelessWidget {
  const PredictionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text("التــحليل",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.pink
              ),
            ),
            SizedBox(height: 15.0,),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
                childAspectRatio: 6/2,
              ),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, i)=> Container(
                height: 10,
                width: 10,
                color: secondaryColor,

              ) ,
              itemCount: 11,

            ),
            SizedBox(height: 20.0,),
            defaultButton(onPressed: (){}, text: "النتــيجه")
          ],
        ),
      ),
    );
  }
}
