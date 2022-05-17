import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hawwah/layout/cubit/home_cubit.dart';
import 'package:hawwah/layout/home_layout.dart';
import 'package:hawwah/models/self_heck_model.dart';
import 'package:hawwah/modules/selfCheck/self_check_result_screen.dart';
import 'package:hawwah/modules/selfCheck/self_check_screen.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/components/components.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class FirstSteps extends StatelessWidget {
  const FirstSteps({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {},
      builder: (context, state){

        return ConditionalBuilder(
          condition:state is! LoadingSelfDataState ,
          builder: (context)=>SelfCheckBuild(HomeCubit.get(context).selfCheckModel!,context),
          fallback: (context)=>const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget SelfCheckBuild(SelfCheckModel? model,context)=>Scaffold(
    appBar: AppBar(
      leading: IconButton(
        onPressed: ()
        {
          navigateToAndFinish(context, HomeLayout());
        },
        icon: const Icon(Icons.arrow_back_ios),
      ),
      title: const Text(
        "الاختبار الأول",
        style:  TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
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
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            // height:MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(20.0)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  buildSelfCheckQuItem(
                    question: '${model!.data!.question!.elementAt(0).question}',
                    image: "assets/images/selfCheck/self1.png",

                    onPressed1: () {
                      HomeCubit.get(context).postAnswer(Id:model.data!.question!.elementAt(0).id, ans:'True');
                    },
                    onPressed0: (){
                      HomeCubit.get(context).postAnswer(Id:model.data!.question!.elementAt(0).id, ans:'False' );
                    },
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 0.4,
                    indent: 15.0,
                    endIndent: 15.0,
                  ),
                  buildSelfCheckQuItem(
                    question: '${model.data!.question!.elementAt(1).question}',
                    image: "assets/images/selfCheck/self2.png",
                    onPressed1: () {
                      HomeCubit.get(context).postAnswer(Id:model.data!.question!.elementAt(1).id, ans:'True' );
                    },
                    onPressed0: (){
                      HomeCubit.get(context).postAnswer(Id:model.data!.question!.elementAt(1).id, ans:'False ');
                    },
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 0.4,
                    indent: 15.0,
                    endIndent: 15.0,
                  ),
                  //
                  buildSelfCheckQuItem(
                    question: '${model.data!.question!.elementAt(2).question}',
                    image: "assets/images/selfCheck/self3.png",
                    onPressed1: () {
                      HomeCubit.get(context).postAnswer(Id:model.data!.question!.elementAt(2).id, ans:'True' );
                    },
                    onPressed0: (){
                      HomeCubit.get(context).postAnswer(Id:model.data!.question!.elementAt(2).id, ans:'False' );
                    },
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 0.4,
                    indent: 15.0,
                    endIndent: 15.0,
                  ),
                  buildSelfCheckQuItem(
                    question:'${model.data!.question?.elementAt(3).question}',
                    image: "assets/images/selfCheck/self3.png",
                    onPressed1: () {
                      HomeCubit.get(context).postAnswer(Id:model.data!.question!.elementAt(3).id, ans:'True' );
                    },
                    onPressed0: (){
                      HomeCubit.get(context).postAnswer(Id:model.data!.question!.elementAt(3).id, ans:'False' );
                    },
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 0.4,
                    indent: 15.0,
                    endIndent: 15.0,
                  ),
                  buildSelfCheckQuItem(
                    question:'${model.data!.question!.elementAt(4).question}',
                    image: "assets/images/selfCheck/self5.png",
                    onPressed1: () {
                      HomeCubit.get(context).postAnswer(Id:model.data!.question!.elementAt(4).id, ans:'True' );
                      return Alert(
                        style: AlertStyle(
                          backgroundColor: primaryColor,
                          animationType: AnimationType.fromTop,
                          isCloseButton: false,
                          isOverlayTapDismiss: true,
                          descTextAlign: TextAlign.center,
                          animationDuration:
                          const Duration(milliseconds: 400),
                          alertBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          descStyle: TextStyle(
                            color: secondaryColor,
                            fontSize: 50.0,
                          ),
                          titleStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                            color: thirdColor,
                          ),
                          alertAlignment: Alignment.center,
                        ),
                        context: context,
                        buttons: [
                          DialogButton(
                            onPressed: () {
                              navigateToAndFinish(context, HomeLayout());
                            },
                            child: const Text(
                              "حسنا ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                                color: Colors.white,
                              ),
                            ),
                            color: thirdColor,
                          ),
                        ],
                      ).show();
                    },
                      onPressed0: () {
                        HomeCubit.get(context).postAnswer(Id:model.data!.question!.elementAt(4).id, ans:'False' );
                        return Alert(
                          style: AlertStyle(
                            backgroundColor: primaryColor,
                            animationType: AnimationType.fromTop,
                            isCloseButton: false,
                            isOverlayTapDismiss: true,
                            descTextAlign: TextAlign.center,
                            animationDuration:
                            const Duration(milliseconds: 400),
                            alertBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              side: const BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            descStyle: TextStyle(
                              color: secondaryColor,
                              fontSize: 50.0,
                            ),
                            titleStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                              color: thirdColor,
                            ),
                            alertAlignment: Alignment.center,
                          ),
                          context: context,
                        );
                      }
                  ),
                  const Divider(
                    color: Colors.white,
                    thickness: 0.4,
                    indent: 15.0,
                    endIndent: 15.0,
                  ),
                  buildSelfCheckQuItem(
                    question: '${model.data!.question!.elementAt(5).question}',
                    image: "assets/images/selfCheck/self6.png",
                    onPressed1: () {
                      HomeCubit.get(context).postAnswer(Id:model.data!.question!.elementAt(5).id, ans:'True' );
                    },
                    onPressed0: (){
                      HomeCubit.get(context).postAnswer(Id:model.data!.question!.elementAt(5).id, ans:'False' );
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: defaultButton(
                        onPressed: () {
                          navigateTo(context, const IntroSelfCheckScreen2());
                        },
                        text: "التــالى",
                        fontSize: 30,
                        width: 150.0,
                        radius: 20),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );

  Widget buildSelfCheckQuItem({
    required String question,
    required String image,
    required Function onPressed1,
    required Function onPressed0,
  }) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            question,
            style: TextStyle(
                color: thirdColor, fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 40.0,
                width: 100.0,
                decoration: BoxDecoration(
                  color: secondaryColor,
                    border: Border.all(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(15.0)),
                child: TextButton(
                    onPressed: () {
                      onPressed1();
                    },
                    child: const Text(
                      "نعم",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
              ),
              Container(
                height: 40.0,
                width: 100.0,
                decoration: BoxDecoration(
                    color: secondaryColor,
                    border: Border.all(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(15.0)),
                child: TextButton(
                    onPressed: () {
                      onPressed0();
                    },
                    child: const Text(
                      "لا",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    )),
              ),
              CircleAvatar(
                backgroundColor: secondaryColor,
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
        title: const Text(
          "الاختبار الثانى",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: scoundScreen(HomeCubit.get(context).selfCheckModel!),
    );
  }
  Widget scoundScreen(SelfCheckModel model)=>Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(248, 157, 185, 1.0),
            Color.fromRGBO(250, 250, 250, 1.0)
          ]),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(20.0)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              buildSelfCheckQuItem(
                question: '${model.data!.question!.elementAt(6).question}',
                image: "assets/images/selfCheck/self7.png",
                onPressed1: () {
                  HomeCubit.get(context).postAnswer(Id:model.data!.question!.elementAt(6).id, ans:'True' );
                },
                onPressed0: (){
                  HomeCubit.get(context).postAnswer(Id:model.data!.question!.elementAt(6).id, ans:'False' );
                },
              ),
              const Divider(
                color: Colors.white,
                thickness: 0.4,
                indent: 15.0,
                endIndent: 15.0,
              ),
              buildSelfCheckQuItem(
                question: '${model.data!.question!.elementAt(7).question}',
                image: "assets/images/selfCheck/self3.png",
                onPressed1: () {
                  HomeCubit.get(context).postAnswer(Id:model.data!.question!.elementAt(7).id, ans:'True' );
                },
                onPressed0: (){
                  HomeCubit.get(context).postAnswer(Id:model.data!.question!.elementAt(7).id, ans:'False' );
                },
              ),
              const Divider(
                color: Colors.white,
                thickness: 0.4,
                indent: 15.0,
                endIndent: 15.0,
              ),
              buildSelfCheckQuItem(
                question:
                '${model.data!.question!.elementAt(8).question}',
                image: "assets/images/selfCheck/self9.png",
                onPressed1: () {
                  HomeCubit.get(context).postAnswer(Id:model.data!.question!.elementAt(8).id, ans:'True' );
                },
                onPressed0: (){
                  HomeCubit.get(context).postAnswer(Id:model.data!.question!.elementAt(8).id, ans:'False' );
                },
              ),
              const Divider(
                color: Colors.white,
                thickness: 0.4,
                indent: 15.0,
                endIndent: 15.0,
              ),

              //SizedBox(height: 100.0,),
              const Spacer(),
              Center(
                child: defaultButton(
                    onPressed: () {
                      navigateToAndFinish(context, const SelfCheckResultScreen());
                    },
                    text:   "تــم",
                    fontSize: 30,
                    width: 150.0,
                    radius: 20),
              ),

            ],
          ),
        ),
      ),
    ),
  );

  Widget buildSelfCheckQuItem({
    required String question,
    required String image,
    required Function onPressed1,
    required Function onPressed0,
  }) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            question,
            style: TextStyle(
                color: thirdColor, fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: secondaryColor,
                    border: Border.all(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(15.0)),
                child: TextButton(
                    onPressed: () {
                      onPressed1();
                    },
                    child: const Text(
                      "نعم",
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    )),
              ),
              Container(
                decoration: BoxDecoration(
                    color: secondaryColor,
                    border: Border.all(color: Colors.white, width: 1.0),
                    borderRadius: BorderRadius.circular(15.0)),
                child: TextButton(
                    onPressed: () {
                      onPressed0();
                    },
                    child: const Text(
                      "لا",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
              ),
              CircleAvatar(
                backgroundColor: secondaryColor,
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
