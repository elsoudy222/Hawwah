

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hawwah/shared/components/colors.dart';

class Question extends StatefulWidget {
  final String question;
  final List<String> answers;
  const Question({Key? key,required this.question,required this.answers}) : super(key: key);

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  String selectAnswer = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
           Text(
            widget.question,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.pink,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 15,
              children: widget.answers.map((answers) => buildButtons(context, answers)).toList(),
            ),
          ),

        ],
      ),
    );
  }

  Widget buildButtons(BuildContext context,  answers){
    final isSelected = selectAnswer == answers;
    final forgroundColor= isSelected? Colors.white : Colors.pink;
    final backgroundColor = isSelected? primaryColor : secondaryColor;
    return GestureDetector(
      onTap: (){
        setState(() {
          selectAnswer = answers;
        });
      },
      child: Chip(
        shape: StadiumBorder(
          side: BorderSide(
            color: Colors.pink
          )
        ),
        label: Text(
            answers,
          style: TextStyle(
            color: forgroundColor,
          ),
        ),
        backgroundColor: backgroundColor,

      ),
    );
  }
}
