import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hawwah/layout/home_layout.dart';
import 'package:hawwah/modules/login/cubit/login_cubit.dart';
import 'package:hawwah/modules/login/cubit/login_states.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../shared/components/components.dart';

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
                            "assets/images/logo.png",
                            height: 200.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "البريد الالكترونى",
                                style: TextStyle(fontSize: 20.0, color: Colors.pink),
                              ),

                              defaultFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                hintText: "ادخل البريد الالكترونى الخاص بك ",
                                prefix: Icons.email_outlined,
                                validate: (String? value){
                                  if (value!.isEmpty) {
                                    return 'البريد الالكترونى غسر صحيح';
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              const Text(
                                "الرقم السرى",
                                style: TextStyle(fontSize: 20.0, color: Colors.pink),
                              ),

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
                                },
                                prefix: Icons.lock_outline,
                                  suffix: LoginCubit.get(context).suffix,
                                 obscureText: LoginCubit.get(context).isPassword,
                                 suffixPressed: (){
                                 LoginCubit.get(context).changePasswordVisibility();
                                }
                              ),
                              defaultTextButton(
                                onPressed: () {},
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
                                  const Text(
                                    "- ليس لديك حساب؟",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.pinkAccent),
                                  ),

                                  defaultTextButton(
                                    onPressed: () {

                                    },
                                    text: "انشاء حساب",

                                  ),
                                ],
                              ),

                              const SizedBox(
                                height: 10.0,
                              ),
                              GestureDetector(
                                onTap: (){},
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






















