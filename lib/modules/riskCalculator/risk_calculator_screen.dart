
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hawwah/modules/riskCalculator/risk_result_screen.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/components/components.dart';

import '../../layout/cubit/home_cubit.dart';
import 'widget.dart';

class RiskCalculatorScreen extends StatefulWidget {
  const RiskCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<RiskCalculatorScreen> createState() => _RiskCalculatorScreenState();
}

class _RiskCalculatorScreenState extends State<RiskCalculatorScreen> {
  var ageController = TextEditingController();

  // List of Questions :
  String Q2 ="كم كان سن المرأة في أول حيض لها؟";
  String Q3 ="كم كان عمر المرأة وقت ولادت الطفل الاول؟";
  String Q4 ="هل سبق للمرأة أن خضعت لأخذ عينة من الثدى؟";
  String Q5 ="كم عدد عينات الثدي (الإيجابية أو السلبية)التي خضعت لها المرأه؟";
  String Q6 ="هل خضعت المرأه لخزعة ثدى واحدة على الأقل مصحوبه بتضخم غير منطقى؟";
  String Q7 ="كم عدد اقارب المرأة من الدرجة الأولى(أم - اخوات - اطفال بنات)مصابات بسرطان الثدي؟";
  String Q8 ="ما هو جنس / عرق المرأة؟";

  // List of Answers :
  List<String> answer2=["لا أعلم","من 7 الى 11","من 12 ال 13","14 أو أكثر",];
  List<String> answer3=["لا أعلم","لم ألد","أقل من 20","من 20 الى 24","من 25 الى 29",'30أو أكثر',];
  List<String> answer4=["لا أعلم","نعم","لا",];
  List<String> answer5=["لا أعلم","0","1","أكثر من 1",];
  List<String> answer6=["لا أعلم","نعم","لا",];
  List<String> answer7=["لا أعلم","0","1","أكثر من 1",];
  List<String> answer8=["لا أعلم","أبيض","أفريقى","اصول اسبانية",'هندى',];



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: double.infinity,
                 height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(20)
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        padding: const EdgeInsets.all(10),
                       // color: Colors.red,
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                                "ما هو سن المرأة؟",
                              style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.pink,
                              ),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Container(
                              //height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                    border: Border.all(color: Colors.pink)
                                ),
                              child: defaultFormField(
                                  controller: ageController,
                                  keyboardType: TextInputType.number,
                                  prefix: Icons.accessibility,
                                hintText: 'العمر من 35 الي 85',
                                validate: (String ?value){
                                    if (value!.isEmpty){
                                      return "svsvzszcvz";
                                    }
                                    return "";
                                }
                              )
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 0.4,
                        height: 1.5,
                      ),
                      const SizedBox(height: 10.0,),
                      Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Question(question: Q2,
                            answers: answer2,
                        ),
                      ),
                      // Container(
                      //   //color: Colors.red,
                      //   width: double.infinity,
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     // mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       const Text(
                      //           "كم كان سن المرأة في أول حيض لها؟",
                      //         style: TextStyle(
                      //           fontSize: 20.0,
                      //           color: Colors.pink,
                      //         ),
                      //       ),
                      //       const SizedBox(
                      //         height: 10.0,
                      //       ),
                      //       Container(
                      //         height: 50,
                      //         child: ListView.separated(
                      //           padding: const EdgeInsets.all(10.0),
                      //           scrollDirection: Axis.horizontal,
                      //             itemBuilder: (context, index) => buildGestureDetector(text: "الاجابه"),
                      //             separatorBuilder: (context,index)=> const SizedBox(width: 5.0,),
                      //             itemCount: 4),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // const Divider(
                      //   thickness: 0.4,
                      //   height: 1.5,
                      // ),
                      // const SizedBox(height: 10.0,),
                      // Container(
                      //   //color: Colors.red,
                      //   width: double.infinity,
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     // mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       const Text(
                      //           "كم كان عمر المرأة وقت ولادت الطفل الاول؟",
                      //         style: TextStyle(
                      //           fontSize: 20.0,
                      //           color: Colors.pink,
                      //         ),
                      //       ),
                      //       const SizedBox(
                      //         height: 10.0,
                      //       ),
                      //       Container(
                      //         height: 50,
                      //         child: ListView.separated(
                      //             padding: const EdgeInsets.all(10.0),
                      //             scrollDirection: Axis.horizontal,
                      //             itemBuilder: (context, index) => buildGestureDetector(text: "الاجابه"),
                      //             separatorBuilder: (context,index)=> const SizedBox(width: 10.0,),
                      //             itemCount: 4),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // const Divider(
                      //   thickness: 0.4,
                      //   height: 1.5,
                      // ),
                      // const SizedBox(height: 10.0,),
                      // Container(
                      //   //color: Colors.red,
                      //   width: double.infinity,
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     // mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       const Text(
                      //           "هل سبق للمرأة أن خضعت لأخذ عينة من الثدى؟ ",
                      //         style: TextStyle(
                      //           fontSize: 20.0,
                      //           color: Colors.pink,
                      //         ),
                      //       ),
                      //       const SizedBox(
                      //         height: 10.0,
                      //       ),
                      //       Container(
                      //         height: 50,
                      //         child: ListView.separated(
                      //             padding: const EdgeInsets.all(10.0),
                      //             scrollDirection: Axis.horizontal,
                      //             itemBuilder: (context, index) => buildGestureDetector(text: "الاجابه"),
                      //             separatorBuilder: (context,index)=> const SizedBox(width: 10.0,),
                      //             itemCount: 4),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // const Divider(
                      //   thickness: 0.4,
                      //   height: 1.5,
                      // ),
                      // const SizedBox(height: 10.0,),
                      // Container(
                      //   //color: Colors.red,
                      //   width: double.infinity,
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     // mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       const Text(
                      //           "كم عدد عينات الثدي (الإيجابية أو السلبية)التي خضعت لها المرأه؟",
                      //         style: TextStyle(
                      //           fontSize: 20.0,
                      //           color: Colors.pink,
                      //         ),
                      //       ),
                      //       const SizedBox(
                      //         height: 10.0,
                      //       ),
                      //       Container(
                      //         height: 50,
                      //         child: ListView.separated(
                      //             padding: const EdgeInsets.all(10.0),
                      //             scrollDirection: Axis.horizontal,
                      //             itemBuilder: (context, index) => buildGestureDetector(text: "الاجابه"),
                      //             separatorBuilder: (context,index)=> const SizedBox(width: 10.0,),
                      //             itemCount: 4),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // const Divider(
                      //   thickness: 0.4,
                      //   height: 1.5,
                      // ),
                      // const SizedBox(height: 10.0,),
                      // Container(
                      //   //color: Colors.red,
                      //   width: double.infinity,
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     // mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       const Text(
                      //           "هل خضعت المرأه لخزعة ثدى واحدة على الأقل مصحوبه بتضخم غير منطقى؟",
                      //         style: TextStyle(
                      //           fontSize: 20.0,
                      //           color: Colors.pink,
                      //         ),
                      //       ),
                      //       const SizedBox(
                      //         height: 10.0,
                      //       ),
                      //       Container(
                      //         height: 50,
                      //         child: ListView.separated(
                      //             padding: const EdgeInsets.all(10.0),
                      //             scrollDirection: Axis.horizontal,
                      //             itemBuilder: (context, index) => buildGestureDetector(text: "الاجابه"),
                      //             separatorBuilder: (context,index)=> const SizedBox(width: 10.0,),
                      //             itemCount: 4),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // const Divider(
                      //   thickness: 0.4,
                      //   height: 1.5,
                      // ),
                      // const SizedBox(height: 10.0,),
                      // Container(
                      //   //color: Colors.red,
                      //   width: double.infinity,
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     // mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       const Text(
                      //           "كم عدد اقارب المرأة من الدرجة الأولى(أم - اخوات - اطفال بنات)مصابات بسرطان الثدي؟",
                      //         style: TextStyle(
                      //           fontSize: 20.0,
                      //           color: Colors.pink,
                      //         ),
                      //       ),
                      //       const SizedBox(
                      //         height: 10.0,
                      //       ),
                      //       Container(
                      //         height: 50,
                      //         child: ListView.separated(
                      //             padding: const EdgeInsets.all(10.0),
                      //             scrollDirection: Axis.horizontal,
                      //             itemBuilder: (context, index) => buildGestureDetector(text: "الاجابه"),
                      //             separatorBuilder: (context,index)=> const SizedBox(width: 10.0,),
                      //             itemCount: 4),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      // const Divider(
                      //   thickness: 0.4,
                      //   height: 1.5,
                      // ),
                      // const SizedBox(height: 10.0,),
                      // Container(
                      //   //color: Colors.red,
                      //   width: double.infinity,
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     // mainAxisAlignment: MainAxisAlignment.start,
                      //     children: [
                      //       const Text(
                      //           "ما هو جنس / عرق المرأة؟",
                      //         style: TextStyle(
                      //           fontSize: 20.0,
                      //           color: Colors.pink,
                      //         ),
                      //       ),
                      //       const SizedBox(
                      //         height: 10.0,
                      //       ),
                      //       Container(
                      //         height: 50,
                      //         child: ListView.separated(
                      //             padding: const EdgeInsets.all(10.0),
                      //             scrollDirection: Axis.horizontal,
                      //             itemBuilder: (context, index) => buildGestureDetector(text: "الاجابه"),
                      //             separatorBuilder: (context,index)=> const SizedBox(width: 10.0,),
                      //             itemCount: 4),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      const Divider(
                        thickness: 0.4,
                        height: 1.5,
                      ),
                      const SizedBox(height: 10.0,),
                      Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(20)
                          ),child: Question(question: Q3, answers: answer3)),
                      const Divider(
                        thickness: 0.4,
                        height: 1.5,
                      ),
                      const SizedBox(height: 20.0,),
                      Question(question: Q4, answers: answer4),
                      const Divider(
                        thickness: 0.4,
                        height: 1.5,
                      ),
                      const SizedBox(height: 20.0,),
                      Question(question: Q5, answers: answer5),
                      const Divider(
                        thickness: 0.4,
                        height: 1.5,
                      ),
                      const SizedBox(height: 20.0,),
                      Question(question: Q6, answers: answer6),
                      const Divider(
                        thickness: 0.4,
                        height: 1.5,
                      ),
                      const SizedBox(height: 20.0,),
                      Question(question: Q7, answers: answer7),
                      const Divider(
                        thickness: 0.4,
                        height: 1.5,
                      ),
                      const SizedBox(height: 20.0,),
                      Question(question: Q8, answers: answer8,isDrop: true,),
                      const Divider(
                        thickness: 0.4,
                        height: 1.5,
                      ),
                      const SizedBox(height: 20.0,),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: defaultButton(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          text: 'نســبة الإصـابة',
                          onPressed: () {
                             navigateTo(context, RiskResultScreen());
                          },
                          radius: 30.0,
                          // width: MediaQuery.of(context).size.width ,
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        );
      },
    );
  }
}




