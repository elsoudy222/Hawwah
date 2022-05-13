import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hawwah/layout/home_layout.dart';
import 'package:hawwah/modules/login/cubit/login_cubit.dart';
import 'package:hawwah/modules/login/cubit/login_states.dart';
import 'package:hawwah/modules/signUp/sign_up_screen.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../shared/components/components.dart';
import '../../shared/components/constants.dart';
import '../../shared/network/local/cache_helper.dart';
import '../changePassword/change_password_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var reseatEmailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if(state is LoginSuccessState){
            if(state.loginModel.status == true){
              print(state.loginModel.messege);
              print(state.loginModel.userData!.tokens!.access);
              CacheHelper.saveData(
                  key: "token",
                  value:state.loginModel.userData!.tokens!.access
              ).then((value) {
                token = state.loginModel.userData!.tokens!.access!;
                navigateToAndFinish(context, HomeLayout());
              });


            }else{
              print(state.loginModel.messege);
              showToast(
                  text: "${state.loginModel.messege}",
                  state: ToastStates.ERROR
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
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
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30.0,
                          ),
                          Image.asset(
                            "assets/images/logo_white.png",
                            fit: BoxFit.contain,
                            height: 200.0,
                            width: 400,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "تســجيل الدخول",
                                style: TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                    color: thirdColor),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),

                              // Email=======================================================
                              TextFormField(
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'البريد الالكترونى غير صحيح ';
                                  } else if (!value.contains('@')) {
                                    return 'البريد الالكترونى غير صحيح ';
                                  }
                                  return null;
                                },
                                controller: emailController,
                                cursorColor: thirdColor,
                                decoration: InputDecoration(
                                  hintText: "ادخل البريد الالكترونى الخاص بك ",
                                  hintStyle: TextStyle(color: thirdColor),
                                  fillColor: secondaryColor,
                                  filled: true,
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: thirdColor,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      borderSide: BorderSide(
                                          color: secondaryColor, width: 2)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      borderSide: BorderSide(
                                          color: secondaryColor, width: 2)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2)),
                                ),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              // Password===================================================
                              TextFormField(
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'كلمة المرور غير صحيحة';
                                  } else if (value.length < 5) {
                                    return 'كلمة المرور قصيرة برجاء ادخال كلمة مرور أكبر';
                                  }
                                  return null;
                                },
                                controller: passwordController,
                                cursorColor: thirdColor,
                                decoration: InputDecoration(
                                  hintText: "ادخل كلمة المرور الخاصة بك ",
                                  hintStyle: TextStyle(color: thirdColor),
                                  fillColor: secondaryColor,
                                  filled: true,
                                  prefixIcon: Icon(
                                    Icons.lock_outlined,
                                    color: thirdColor,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      borderSide: BorderSide(
                                          color: secondaryColor, width: 2)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      borderSide: BorderSide(
                                          color: secondaryColor, width: 2)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 2)),
                                ),
                              ),
                              defaultTextButton(
                                onPressed: () {
                                  return Alert(
                                    style: AlertStyle(
                                      backgroundColor: primaryColor,
                                      animationType: AnimationType.fromTop,
                                      isCloseButton: false,
                                      isOverlayTapDismiss: false,
                                      descTextAlign: TextAlign.start,
                                      animationDuration:
                                      const Duration(milliseconds: 400),
                                      alertBorder: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            15.0),
                                        side: const BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      descStyle: TextStyle(
                                        color: secondaryColor,
                                      ),
                                      titleStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25.0,
                                        color: thirdColor,
                                      ),
                                      alertAlignment: Alignment.center,
                                    ),
                                    context: context,
                                    title: "تغير كلمه المرور",
                                    desc:
                                    "قم بادخال البريد الالكترونى المرتبط بحسابك وسنرسل اليك رابط تعيين كلمه المرور",
                                    content: TextFormField(
                                      validator: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'البريد الالكترونى غير صحيح ';
                                        } else if (!value.contains('@')) {
                                          return 'البريد الالكترونى غير صحيح ';
                                        }
                                        return null;
                                      },
                                      controller: reseatEmailController,
                                      cursorColor: thirdColor,
                                      decoration: InputDecoration(
                                        hintText: "ادخل البريد الالكترونى الخاص بك ",
                                        hintStyle: TextStyle(color: thirdColor),
                                        fillColor: secondaryColor,
                                        filled: true,
                                        prefixIcon: Icon(
                                          Icons.email_outlined,
                                          color: thirdColor,
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                30.0),
                                            borderSide: BorderSide(
                                                color: secondaryColor,
                                                width: 2)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                30.0),
                                            borderSide: BorderSide(
                                                color: secondaryColor,
                                                width: 2)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                30.0),
                                            borderSide: BorderSide(
                                                color: Colors.white, width: 2)),
                                      ),
                                    ),
                                    buttons: [
                                      DialogButton(
                                        onPressed: () {
                                          navigateTo(
                                              context, const ChangePassword());
                                        },
                                        child: const Text(
                                          "اعادة التعيين ",
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
                                text: "نسيت كلمه المرور؟",
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              (state is! LoginLoadingState)
                                  ? defaultButton(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                text: 'تسجيل الدخول',
                                onPressed: () {
                                  navigateToAndFinish(context, HomeLayout());
                                  // if (formKey.currentState!.validate()) {
                                  //   LoginCubit.get(context).userLogin(
                                  //       email: emailController.text,
                                  //       password: passwordController.text);
                                  // }
                                },
                                radius: 30.0,
                                // width: MediaQuery.of(context).size.width ,
                              )
                                  : const Center(
                                  child: const CircularProgressIndicator()),
                              const SizedBox(
                                height: 20.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  // TODO:
                                },
                                child: Container(
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        child: const Image(
                                          image: AssetImage(
                                            "assets/images/google.png",
                                          ),
                                        ),
                                        height: 40,
                                        width: 40,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "تسجيل الدخول باستخدام جوجل",
                                        style: TextStyle(
                                            fontSize: 20.0, color: thirdColor),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "- ليس لديك حساب؟",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Color.fromRGBO(248, 157, 185, 1.0),
                                    ),
                                  ),
                                  defaultTextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SignupScreen()));
                                    },
                                    text: "انشاء حساب",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
