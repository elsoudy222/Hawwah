import 'package:flutter/material.dart';
import 'package:hawwah/modules/selfCheck/self_check_result_screen.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/components/components.dart';

import '../../layout/home_layout.dart';

class FirstSteps extends StatelessWidget {
   FirstSteps({Key? key}) : super(key: key);
  var pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    image: "assets/images/logo.png",
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
                    image: "assets/images/logo.png",
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
                    image: "assets/images/logo.png",
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
                    image: "assets/images/logo.png",
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
                    image: "assets/images/logo.png",
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
                    image: "assets/images/logo.png",
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
                        pageController.nextPage(
                            duration: Duration(milliseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn);
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
                maxRadius: 35.0,
              )
            ],
          )
        ],
      ),
    );
  }
}

class SecondSteps extends StatelessWidget {
  const SecondSteps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    image: "assets/images/logo.png",
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
                    image: "assets/images/logo.png",
                    onPressed: (){},
                  ),
                  const Divider(
                    color: Colors.pink,
                    thickness: 0.4,
                    indent: 15.0,
                    endIndent: 15.0,
                  ),
                  buildSelfCheckQuItem(
                    question: "هل يوج تغير فى لون الحلمه الى(الأحمر)",
                    image: "assets/images/logo.png",
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
                    image: "assets/images/logo.png",
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
                    image: "assets/images/logo.png",
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
                    image: "assets/images/logo.png",
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
                maxRadius: 35.0,
              )
            ],
          )
        ],
      ),
    );
  }
}
