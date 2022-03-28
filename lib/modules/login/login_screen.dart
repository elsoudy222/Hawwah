
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hawwah/layout/home_layout.dart';
import 'package:hawwah/modules/login/cubit/login_cubit.dart';
import 'package:hawwah/modules/login/cubit/login_states.dart';
import 'package:hawwah/modules/signUp/sign_up_screen.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../../shared/components/components.dart';
import '../changePassword/change_password_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);


  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context, state) {

        },
        builder: (context,state){
          return  Scaffold(
              backgroundColor: HexColor("#FAACC3"),
              body: Center(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          // const SizedBox(
                          //   height: 20.0,
                          // ),
                          Image.asset(

                            "assets/images/logo_white.png",
                            fit: BoxFit.contain,
                            height: 200.0,
                            width: 400,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "تســجيل الدخول",
                                style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold, color: Colors.pink),
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              defaultFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                hintText: "ادخل البريد الالكترونى الخاص بك ",
                                prefix: Icons.email_outlined,
                                validate: (String? value){
                                  if (value!.isEmpty || !value.contains("@")) {
                                    return 'البريد الالكترونى غسر صحيح';
                                  }
                                  return "";
                                },
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              // const Text(
                              //   "الرقم السرى",
                              //   style: TextStyle(fontSize: 20.0, color: Colors.pink),
                              // ),

                              defaultFormField(
                                controller: passwordController,
                                keyboardType: TextInputType.text,
                                hintText: "ادخل الرقم السرى الخاص بك ",
                                // onSubmit: (value) {
                                //   if (formKey.currentState!.validate()) {
                                //     LoginCubit.get(context).userLogin(
                                //       email: emailController.text,
                                //       password: passController.text,
                                //     );
                                //   }
                                // },
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'الرقم السرى غير صحيح ';
                                  }
                                  return "";
                                },
                                prefix: Icons.lock_outline,
                                  suffix: LoginCubit.get(context).suffix,
                                 obscureText: LoginCubit.get(context).isPassword,
                                 suffixPressed: (){
                                 LoginCubit.get(context).changePasswordVisibility();
                                }
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

                                     animationDuration: Duration(milliseconds: 400),
                                     alertBorder: RoundedRectangleBorder(
                                       borderRadius: BorderRadius.circular(15.0),
                                       side: BorderSide(
                                         color: Colors.grey,
                                       ),
                                     ),
                                     descStyle: TextStyle(

                                       color: secondaryColor,
                                     ),
                                     titleStyle: TextStyle(
                                       fontWeight: FontWeight.bold,
                                       fontSize: 25.0,
                                       color: Colors.pink,
                                     ),
                                     alertAlignment: Alignment.center,
                                   ),
                                    context: context,
                                    title: "تغير كلمه المرور",
                                   desc: "قم بادخال البريد الالكترونى المرتبط بحسابك وسنرسل اليك رابط تعيين كلمه المرور",
                                   content: defaultFormField(
                                     controller: emailController,
                                     keyboardType: TextInputType.emailAddress,
                                     hintText: "ادخل البريد الالكترونى الخاص بك ",
                                     prefix: Icons.email_outlined,
                                     validate: (String? value){
                                       if (value!.isEmpty || !value.contains("@")) {
                                         return 'البريد الالكترونى غسر صحيح';
                                       }
                                       return "" ;
                                     },
                                   ),
                                   buttons: [
                                     DialogButton(
                                       onPressed: () {
                                         // Navigator.pushAndRemoveUntil(context,
                                         //     MaterialPageRoute(
                                         //         builder: (context) => ChangePasswordScreen(),
                                         //     ), (route) => false
                                         // );
                                       },
                                       child: Container(
                                         color: Colors.pink,
                                         child: Text(
                                             "اعادة التعيين ",
                                           style: TextStyle(
                                             fontWeight: FontWeight.bold,
                                             fontSize: 25.0,
                                             color: Colors.white,
                                           ),
                                         ),
                                       ) ,
                                     )
                                   ]
                                  ).show();
                                },
                                text: "نسيت كلمه المرور؟",
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              defaultButton(
                                text: 'تسجيل الدخول',
                                onPressed: () {
                                  navigateToAndFinish(context, HomeLayout());
                                },
                                radius: 30.0,
                                // width: MediaQuery.of(context).size.width ,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children:  [
                                   Text(
                                    "- ليس لديك حساب؟",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.pink[50]),
                                  ),
                                  defaultTextButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context)=>SignupScreen()));
                                    },
                                    text: "انشاء حساب",

                                  ),
                                ],
                              ),

                              const SizedBox(
                                height: 10.0,
                              ),
                              GestureDetector(
                                onTap: (){
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
                                      const SizedBox(width: 20,),
                                      Container(
                                        child: const Image(
                                          image: AssetImage("assets/images/google.png",),
                                        ),
                                        height: 40,
                                        width: 40,
                                      ),
                                      const SizedBox(width: 10,),
                                      const Text(
                                        "تسجيل الدخول باستخدام جوجل",
                                        style: TextStyle(fontSize: 20.0, color: Colors.pink),
                                      )

                                    ],
                                  ),
                                ),
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






















