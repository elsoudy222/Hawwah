
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hawwah/modules/profile/cubit/profile_cubit.dart';
import 'package:hawwah/shared/components/components.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var formKey1 = GlobalKey<FormState>();
  var formKey2 = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var birthController = TextEditingController();
  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => ProfileCubit(),
  child: BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(200),
            child: SizedBox(
              height: 400,
              child: Stack(
                children: [
                  AppBar(
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_sharp,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(200)),
                    ),
                    backgroundColor: Color.fromRGBO(206, 86, 139, 1),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.pink, width: 2),
                          shape: BoxShape.circle),
                      height: 150,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        maxRadius: 50,
                        child: Image.asset(
                          'assets/icons/profile_pic.png',
                          fit: BoxFit.fill,
                          height: 70,
                          width: 70,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Form(
                key: formKey1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [


                    // Name formField ....
                    Container(
                      height: 55.0,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(249, 192, 209, 1),
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset:
                                const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),

                      child: defaultFormField(
                          prefix: Icons.person,
                          keyboardType: TextInputType.text,
                          controller: nameController,
                          hintText: "الاســم",
                          hintColor: Colors.white,
                          prefixColor: Colors.white,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return " يجب إدخال الاسم بصوره صحيحة";
                            }
                            return null;
                          }),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    // Email FormField...
                    Container(
                      height: 55.0,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(249, 192, 209, 1),
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset:
                            const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),

                      child: defaultFormField(
                          prefix: Icons.email,
                          keyboardType: TextInputType.text,
                          controller: emailController,
                          hintText: "البريد الإلكترونى",
                          hintColor: Colors.white,
                          prefixColor: Colors.white,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return " يجب إدخال الاسم بصوره صحيحة";
                            }
                            return null;
                          }),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    //Phone FormField ...
                    Container(
                      height: 55.0,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(249, 192, 209, 1),
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset:
                            const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),

                      child: defaultFormField(
                          prefix: Icons.phone,
                          keyboardType: TextInputType.phone,
                          controller: phoneController,
                          hintText: "رقم الهاتف",
                          hintColor: Colors.white,
                          prefixColor: Colors.white,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return " يجب إدخال الاسم بصوره صحيحة";
                            }
                            return null;
                          }),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    // birthDate ...
                    Container(
                      height: 55.0,
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(249, 192, 209, 1),
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset:
                            const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),

                      child: defaultFormField(
                          prefix: Icons.date_range,
                          keyboardType: TextInputType.numberWithOptions(),
                          controller: birthController,
                          hintText: "تاريخ الميلاد",
                          hintColor: Colors.white,
                          prefixColor: Colors.white,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return " يجب إدخال الاسم بصوره صحيحة";
                            }
                            return null;
                          }),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    // Change Password ...
                    Container(
                      width: double.infinity,
                      height: 55,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(250, 138, 198, 1),
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                      BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset:
                      const Offset(0, 3), // changes position of shadow
                    ),],
                      ),
                      child: MaterialButton(
                        focusColor: Colors.pink,
                        onPressed: () {
                          final AlertDialog alert = AlertDialog(

                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),

                            title: Text("تغيير كلمة المرور") ,
                            titleTextStyle: TextStyle(
                                color: Color.fromRGBO(239, 92, 147, 1),
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                            ),
                            content: Container(
                              height: 350,
                              child: Form(
                                key: formKey2,
                                child: Column(
                                  children: [
                                    Divider(
                                      color:  Color.fromRGBO(239, 92, 147, 1),
                                      thickness: 1.0,
                                      height: 20.0,
                                    ),
                                    defaultFormField(
                                        controller: oldPasswordController,
                                        keyboardType: TextInputType.text,
                                        hintText: "ادخل الرقم السرى القديم ",
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
                                        // suffix: ProfileCubit.get(context).suffix,
                                        // obscureText: ProfileCubit.get(context).isPassword,
                                        // suffixPressed: (){
                                        //   ProfileCubit.get(context).changePasswordVisibilityy();
                                        // }
                                    ),
                                    SizedBox(height: 10.0,),
                                    defaultFormField(
                                        controller: newPasswordController,
                                        keyboardType: TextInputType.text,
                                        hintText: "ادخل الرقم السرى الجديد ",
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
                                        // suffix: ProfileCubit.get(context).suffix,
                                        // obscureText: ProfileCubit.get(context).isPassword,
                                        // suffixPressed: (){
                                        //   ProfileCubit.get(context).changePasswordVisibilityy();
                                        // }
                                    ),
                                    SizedBox(height: 10.0,),
                                    defaultFormField(
                                        controller: confirmPasswordController,
                                        keyboardType: TextInputType.text,
                                        hintText: "إعادة ادخال الرقم السرى الجديد ",
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
                                        //suffix: ProfileCubit.get(context).suffix,
                                        //obscureText: ProfileCubit.get(context).isPassword,
                                        // suffixPressed: (){
                                        //   ProfileCubit.get(context).changePasswordVisibilityy();
                                        // }
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: (){
                                        print("tapped");
                                      },
                                      child: Container(
                                        width: 150,
                                        height: 60,
                                        padding: const EdgeInsets.all(10),
                                        alignment: Alignment.center,
                                        decoration:  BoxDecoration(
                                          color:  Color.fromRGBO(250, 138, 198, 1),
                                          border: Border.all(color: Colors.white),
                                          borderRadius: BorderRadius.all(Radius.circular(25)),
                                        ),
                                        child: const Text(
                                          'تعديل',
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ) ,
                          );
                          showDialog(
                            context: context,
                            builder: (BuildContext context)=> alert,) ;
                        },
                        child: Row(
                          children: [
                            Icon(Icons.lock , color: Colors.white,),
                            Text(
                              "تغيير الرقم السرى",
                              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    GestureDetector(
                      onTap: (){
                        print("tapped");
                      },
                      child: Container(
                        width: 150,
                        height: 60,
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        decoration:  BoxDecoration(
                          color:  Color.fromRGBO(250, 138, 198, 1),
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: const Text(
                          'تعديل',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    ),
);
  }

  void buildDialog(BuildContext context,state) {
    ;
  }
}
