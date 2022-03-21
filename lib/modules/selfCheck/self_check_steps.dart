import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hawwah/modules/selfCheck/self_check_result_screen.dart';
import 'package:hawwah/modules/selfCheck/self_check_screen.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/components/components.dart';

import '../../layout/home_layout.dart';

class FirstSteps extends StatefulWidget {
   FirstSteps({Key? key}) : super(key: key);

  @override
  State<FirstSteps> createState() => _FirstStepsState();
}
class _FirstStepsState extends State<FirstSteps> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "الاختبار الأول",
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            // height:MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(20.0)
            ),
            child: Padding(
              padding: const EdgeInsets.all( 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildSelfCheckQuItem(
                    question: "هل يوجد اختلاف شكلى فى حجم الثديين؟",
                    image: "assets/images/selfCheck/self1.png",
                    onPressed: (){},
                  ),
                  const Divider(
                    color: Colors.pink,
                    thickness: 0.4,
                    indent: 15.0,
                    endIndent: 15.0,
                  ),
                  buildSelfCheckQuItem(
                    question: "هل يوجد دمامل أو بروز فى الجلد",
                    image: "assets/images/selfCheck/self2.png",
                    onPressed: (){},
                  ),
                  const Divider(
                    color: Colors.pink,
                    thickness: 0.4,
                    indent: 15.0,
                    endIndent: 15.0,
                  ),
                  //
                  buildSelfCheckQuItem(
                    question: "هل يوج تغير فى لون الحلمه الى(الأحمر)",
                    image: "assets/images/selfCheck/self3.png",
                    onPressed: (){},
                  ),
                  const Divider(
                    color: Colors.pink,
                    thickness: 0.4,
                    indent: 15.0,
                    endIndent: 15.0,
                  ),
                  buildSelfCheckQuItem(
                    question: "عل يوجد اختلاف عن المعتاد فى شكل الحلمه\n (فى حالة كانت مائله او ليست فى الوسط)",
                    image: "assets/images/selfCheck/self3.png",
                    onPressed: (){},
                  ),
                  const Divider(
                    color: Colors.pink,
                    thickness: 0.4,
                    indent: 15.0,
                    endIndent: 15.0,
                  ),
                  buildSelfCheckQuItem(
                    question: "هل يوجد افرازات (دم) أو مائله الى اللون الأحمر",
                    image: "assets/images/selfCheck/self5.png",
                    onPressed: (){
                    },
                  ),
                  const Divider(
                    color: Colors.pink,
                    thickness: 0.4,
                    indent: 15.0,
                    endIndent: 15.0,
                  ),
                  buildSelfCheckQuItem(
                    question: "هل يوجد تقشر او تجعد حاد فى جلد الثدى",
                    image: "assets/images/selfCheck/self6.png",
                    onPressed: (){},
                  ),
                  SizedBox(height: 20.0,),
                  Center(
                    child: GestureDetector(
                      child: Container(
                        width: 150.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        child: const Center(
                            child: Text(
                              "التــالى",
                              style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold, color: Colors.white),
                            )),
                      ),
                      onTap: () {
                        navigateTo(context, IntroSelfCheckScreen2());
                      },
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSelfCheckQuItem({
    required String question,
    required String image,
    required Function onPressed,

  }) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          Text(
            question,
            style:TextStyle(
                color: Colors.pink,
                fontSize: 18.0,
                fontWeight: FontWeight.bold
            ) ,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 40.0,
                width: 100.0,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.pink,width: 1.0),
                    borderRadius: BorderRadius.circular(15.0)
                ),
                child: TextButton(
                    onPressed: (){
                      onPressed();
                    },
                    child: Text("نعم")
                ),
              ),
              Container(
                height: 40.0,
                width: 100.0,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.pink,width: 1.0),
                    borderRadius: BorderRadius.circular(15.0)
                ),
                child: TextButton(
                    onPressed: (){
                      onPressed();
                    },
                    child: Text("لا")
                ),
              ),
              CircleAvatar(
                backgroundColor:secondaryColor,
                backgroundImage: AssetImage(image),
                maxRadius: 50.0,
              )
            ],
          )
        ],
      ),
    );
  }
}




class SecondSteps extends StatefulWidget {
  const SecondSteps({Key? key}) : super(key: key);

  @override
  State<SecondSteps> createState() => _SecondStepsState();
}
class _SecondStepsState extends State<SecondSteps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "الاختبار الثانى",
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
           height:MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
              color: secondaryColor,
              borderRadius: BorderRadius.circular(20.0)
          ),
          child: Padding(
            padding: const EdgeInsets.all( 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                buildSelfCheckQuItem(
                  question: "هل يوجد تكتل في منطقة الابطين؟",
                  image: "assets/images/selfCheck/self7.png",
                  onPressed: (){},
                ),
                const Divider(
                  color: Colors.pink,
                  thickness: 0.4,
                  indent: 15.0,
                  endIndent: 15.0,
                ),
                buildSelfCheckQuItem(
                  question: "هل يوجد تكتل فى الثدى 'حول الحلمة'",
                  image: "assets/images/selfCheck/self3.png",
                  onPressed: (){},
                ),
                const Divider(
                  color: Colors.pink,
                  thickness: 0.4,
                  indent: 15.0,
                  endIndent: 15.0,
                ),
                buildSelfCheckQuItem(
                  question: '"اضغطى على الحلمه ثم شاهدى"\n هل يوجد اى افرازات؟',
                  image: "assets/images/selfCheck/self9.png",
                  onPressed: (){},
                ),
                const Divider(
                  color: Colors.pink,
                  thickness: 0.4,
                  indent: 15.0,
                  endIndent: 15.0,
                ),

                //SizedBox(height: 100.0,),
                Spacer(),
                Center(
                  child: GestureDetector(
                    child: Container(
                      width: 150.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: const Center(
                          child: Text(
                            "تــم",
                            style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold, color: Colors.white),
                          )),
                    ),
                    onTap: () {
                      navigateToAndFinish(context, SelfCheckResultScreen());
                    },
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );


  }

  Widget buildSelfCheckQuItem({
    required String question,
    required String image,
    required Function onPressed,

  }) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            question,
            style:const TextStyle(
                color: Colors.pink,
                fontSize: 18.0,
                fontWeight: FontWeight.bold
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.pink,width: 1.0),
                    borderRadius: BorderRadius.circular(15.0)
                ),
                child: TextButton(
                    onPressed: (){
                      onPressed();
                    },
                    child: Text("نعم")
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.pink,width: 1.0),
                    borderRadius: BorderRadius.circular(15.0)
                ),
                child: TextButton(
                    onPressed: (){
                      onPressed();
                    },
                    child: Text("لا")
                ),
              ),
              CircleAvatar(
                backgroundColor:secondaryColor,
                backgroundImage: AssetImage(image),
                maxRadius: 50.0,
              )
            ],
          )
        ],
      ),
    );
  }
}
