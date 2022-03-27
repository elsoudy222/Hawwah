

import 'dart:ui';

import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/components/components.dart';

class Question extends StatefulWidget {
  final String question;
  final List<String> answers;
  final bool isDrop;
  const Question({Key? key,required this.question,required this.answers,this.isDrop=false}) : super(key: key);

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  String selectAnswer = "";
  String? selectedValue;
  bool isSelect=false;
  List<String> items = [
    'أسيوى',
    'صيني',
    'ياباني',
    'فلبيني',
    'هاواي',
    'جزر المحيط الهادئ الاخري',
    'أمريكي اسيوي اخر',
  ];
  @override
  Widget build(BuildContext context) {
    bool isSelected;
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 15,
                    children: widget.answers.map((answers) {
                      isSelected = selectAnswer == answers;
                      final forgroundColor= isSelected? Colors.white : Colors.pink;
                      final backgroundColor = isSelected? primaryColor : secondaryColor;
                      return GestureDetector(
                        onTap: (){
                          setState(() {
                            selectAnswer = answers;
                            isSelect=false;
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
                    }).toList(),
                  ),
                ),
                const SizedBox(
                 width: 10.0,
                ),
                widget.isDrop?
                SizedBox(
                  width: 90,
                  child: DropdownButtonFormField2(
                    decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      fillColor:  isSelect ?primaryColor :secondaryColor,
                      contentPadding: EdgeInsets.zero,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.pink,),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.pink,),
                      ),
                    ),
                    isExpanded: true,
                    hint: Text(
                      'أسيوى',
                      style: TextStyle(fontSize: 14, color: isSelect?Colors.white:Colors.pink,),
                    ),
                    style: TextStyle(fontSize: 14, color: isSelect?Colors.white : Colors.pink),
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.pink,
                    ),
                    buttonHeight: 35,
                    dropdownWidth: 100,
                    buttonPadding: const EdgeInsets.only(left: 8, right: 10),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                        color: primaryColor
                    ),
                    items: items
                        .map((item) =>
                        DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                        .toList(),
                    onTap: () {
                      setState(() {
                        isSelect=true;
                      });
                    },
                    onChanged: (value) {
                      selectedValue = value.toString();
                      print("111 ${value}");
                    },
                  ),
                ) : SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
