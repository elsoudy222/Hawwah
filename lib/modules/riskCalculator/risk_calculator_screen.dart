
import 'package:flutter/material.dart';
import 'package:hawwah/shared/components/colors.dart';


class RiskCalculatorScreen extends StatefulWidget {
  const RiskCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<RiskCalculatorScreen> createState() => _RiskCalculatorScreenState();
}

class _RiskCalculatorScreenState extends State<RiskCalculatorScreen> {

  // List<Risk> risk=[
  //   Risk(
  //       question: "question",
  //       answers: ListView(
  //         children: [
  //           buildGestureDetector(text: "1"),
  //           buildGestureDetector(text: "2"),
  //         ],
  //   )),
  //   Risk(
  //       question: "question",
  //       answers: ListView(
  //         children: [
  //           buildGestureDetector(text: "1"),
  //           buildGestureDetector(text: "2"),
  //           buildGestureDetector(text: "1"),
  //           buildGestureDetector(text: "2"),
  //         ],
  //       )),
  //   Risk(
  //       question: "question",
  //       answers: ListView(
  //         children: [
  //           buildGestureDetector(text: "1"),
  //           buildGestureDetector(text: "2"),
  //           buildGestureDetector(text: "1"),
  //           buildGestureDetector(text: "2"),
  //         ],
  //       )),
  //   Risk(
  //       question: "question",
  //       answers: ListView(
  //         children: [
  //           buildGestureDetector(text: "1"),
  //           buildGestureDetector(text: "2"),
  //         ],
  //       )),
  //   Risk(
  //       question: "question",
  //       answers: ListView(
  //         children: [
  //           buildGestureDetector(text: "1"),
  //           buildGestureDetector(text: "2"),
  //           buildGestureDetector(text: "1"),
  //           buildGestureDetector(text: "2"),
  //           buildGestureDetector(text: "1"),
  //           buildGestureDetector(text: "2"),
  //         ],
  //       )),
  //   Risk(
  //       question: "question",
  //       answers: ListView(
  //         children: [
  //           buildGestureDetector(text: "1"),
  //           buildGestureDetector(text: "2"),
  //           buildGestureDetector(text: "1"),
  //           buildGestureDetector(text: "2"),
  //           buildGestureDetector(text: "1"),
  //           buildGestureDetector(text: "2"),
  //         ],
  //       )),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(20.0)
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),

            ),
          )
        ),
      ),
    );
  }


}

Widget buildRiskQuestion(context,   model) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("${model.question}"),
      SizedBox(height: 15,),
      Container(
        color: Colors.grey[300],
        child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
            childAspectRatio: 1 / 1.58,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              buildGestureDetector(text: "${model.answers}")
            ]

        ),
      )],
  );
}

  Widget buildGestureDetector({required String text}) {
    return GestureDetector(
    child: Container(
      width: 100.0,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child:  Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 15.0, color: Colors.white),
          )),
    ),
    onTap: () {},
  );
  }

