
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hawwah/modules/login/login_screen.dart';
import 'package:hawwah/modules/signUp/cubit/login_cubit.dart';
import 'package:hawwah/modules/signUp/cubit/login_states.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../shared/components/components.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var ageController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(),
      child: BlocConsumer<SignupCubit, SignupStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              backgroundColor: HexColor("#FAACC3"),
              body: Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/logo.png",
                            height: 200.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 150.0,
                                    child: defaultFormField(
                                      label: "الاسـم",
                                      controller: firstNameController,
                                      keyboardType: TextInputType.text,
                                      prefix: Icons.person,
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'برجاء ادخال الاسم بصوره صحيحه';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  Container(
                                    width: 200.0,
                                    child: defaultFormField(
                                      label: "اسم العائله",
                                      controller: lastNameController,
                                      keyboardType: TextInputType.text,
                                      prefix: Icons.person,
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'برجاء ادخال الاسم بصوره صحيحه';
                                        }
                                        return null;

                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              defaultFormField(
                                controller: ageController,
                                keyboardType: TextInputType.number,
                                label: "العمر",
                                hintText: "ادخل العمر الخاص بك ",
                                prefix: Icons.accessibility,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'برجاء ادخال العمر';
                                  }
                                  return null;

                                },
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              defaultFormField(
                                controller: phoneController,
                                keyboardType: TextInputType.number,
                                label: "ادخل رقم الهاتف",
                                hintText: "ادخل رقم الهاتف الخاص بك ",
                                prefix: Icons.phone,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'رقم الهاتف غير صحيح';
                                  }
                                  return null;

                                },
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              defaultFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                hintText: "ادخل البريد الالكترونى الخاص بك ",
                                prefix: Icons.email_outlined,
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'البريد الالكترونى غسر صحيح';
                                  }
                                  return null;

                                },
                              ),
                              const SizedBox(
                                height: 20.0,
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
                                  validate: (String ?value) {
                                    if (value!.isEmpty) {
                                      return 'الرقم السرى غير صحيح ';
                                    }
                                    return null;
                                  },
                                  prefix: Icons.lock_outline,
                                  suffix: SignupCubit.get(context).suffix,
                                  obscureText:
                                      SignupCubit.get(context).isPassword,
                                  suffixPressed: () {
                                    SignupCubit.get(context)
                                        .changePasswordVisibility();
                                  }),
                              const SizedBox(
                                height: 10.0,
                              ),
                              defaultButton(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                text: 'إنشـاء حساب جديد',
                                onPressed: () {
                                  // navigateToAndFinish(context, HomeLayout());
                                },
                                radius: 30.0,
                                // width: MediaQuery.of(context).size.width ,
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "-  لديك حساب بالفعل؟",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.pinkAccent),
                                  ),
                                  defaultTextButton(
                                    onPressed: () {
                                      navigateToAndFinish(
                                          context, LoginScreen());
                                    },
                                    text: "تسجيل الدخول",
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              GestureDetector(
                                onTap: () {},
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
                                        width: 30,
                                      ),
                                      const Text(
                                        "الدخول باستخدام جوجل",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                            color: Colors.pink),
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
