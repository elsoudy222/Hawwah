import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hawwah/shared/components/components.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool ishidden = true;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Stack(
          children: [
            background(),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 10),
                  const Text(
                    'حَوَّاء ',
                    style: TextStyle(
                      fontFamily: 'Barada Reqa',
                      fontSize: 120,
                      color: Color(0xffffffff),
                      shadows: [
                        Shadow(
                          color: Color(0x29000000),
                          offset: Offset(5, 5),
                          blurRadius: 6,
                        )
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        color: const Color.fromRGBO(253, 220, 230, 1.0),
                        borderRadius: BorderRadius.circular(70.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 5, bottom: 5),
                        child: TextFormField(
                          cursorColor: Colors.grey,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: "البريد الالكترونى",
                            labelStyle: TextStyle(
                              color: Colors.black45,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: double.infinity,
                        height: 55,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                          color: const Color.fromRGBO(253, 220, 230, 1.0),
                          borderRadius: BorderRadius.circular(70.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 5, bottom: 5),
                          child: TextFormField(
                            cursorColor: Colors.grey,
                            obscureText: ishidden,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'الرقم السري',
                                hintStyle: TextStyle(
                                  color: Colors.black45,
                                ),
                                hintTextDirection: TextDirection.rtl,
                                icon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      ishidden = !ishidden;
                                    });
                                  },
                                  icon: ishidden
                                      ? Image.asset(
                                    'assets/images/hidden.png',
                                    fit: BoxFit.contain,
                                    width: 25,
                                  )
                                      : Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.black,
                                  ),
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton(
                            onPressed: () {
                              bottomSheet(context);
                            },
                            child: const Text('هل نسيت الرقم السري ؟'),
                            style: TextButton.styleFrom(
                              primary: const Color.fromRGBO(239, 92, 147, 1.0),
                              textStyle: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: const Text(
                            'تسجيل الدخول ',
                            style: TextStyle(
                              fontFamily: 'Segoe UI',
                              fontSize: 22,
                              color: Color(0xffffffff),
                              letterSpacing: 3.1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(206, 86, 139, 1.0),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(70.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 310,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'continue with gmail',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'Segoe UI',
                                  fontSize: 20,
                                  color: Color.fromRGBO(112, 73, 90, 0.9),
                                  letterSpacing: 3.1,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                'assets/images/search.png',
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(70.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextButton(
                      onPressed: () {
                        navigateTo(context, signUp());
                      },
                      child: const Text('انشاء حساب '),
                      style: TextButton.styleFrom(
                        primary: const Color.fromRGBO(239, 92, 147, 1.0),
                        textStyle: const TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget background() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(249, 157, 185, 1.0),
              Color.fromRGBO(253, 220, 230, 1.0)
            ]),
      ),
    );
  }

  void bottomSheet(BuildContext context,) {
    showCupertinoModalPopup(
        context: context,
        builder: (context)
        {
          return Center(
            child: Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              height: 450,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(249, 157, 185, 1.0),
                      Color.fromRGBO(253, 220, 230, 1.0)
                    ]),
              ),
              child: Scaffold(
                body: Container(
                  height: 450,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(249, 157, 185, 1.0),
                          Color.fromRGBO(253, 220, 230, 1.0)
                        ]),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'تغير كلمة السر',
                        style: TextStyle(fontSize: 35, color: Colors.white),
                      ),
                      const Text(
                        'ادخل البريد الالكتروني المرتبط بحسابك و سنرسل اليك تعليمات لاعاده تعيين كلمه المرور عبر البريد الالكتروني',
                        style: TextStyle(fontSize: 22, color: Colors.white),
                        textAlign: TextAlign.right,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            color: const Color.fromRGBO(253, 220, 230, 1.0),
                            borderRadius: BorderRadius.circular(70.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 5, bottom: 5),
                            child: TextFormField(
                              cursorColor: Colors.grey,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                labelText: "ادخال البريد الالكترونى",
                                labelStyle: TextStyle(
                                    color: Colors.black45
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 150),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              child: Center(
                                child: const Text(
                                  'ارسل التعليمات ',
                                  style: TextStyle(
                                    fontFamily: 'Segoe UI',
                                    fontSize: 23,
                                    color: Color(0xffffffff),
                                    letterSpacing: 3.1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                      return const signUp();
                                    }));
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  const Color.fromRGBO(206, 86, 139, 1.0),
                                ),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(70.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class signUp extends StatefulWidget {
  const signUp({Key ?key}) : super(key: key);

  @override
  _signUpState createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  bool ishidden = true;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: Stack(
          children: [
            background(),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 40.0,
                  right: 10.0,
                  left: 10.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_sharp,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                        Text(
                          'رجوع ',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        )
                      ],
                    ),
                    const SizedBox(height: 40),
                    const Padding(
                      padding: EdgeInsets.only(left: 140),
                      child: Text(
                        'انشاء رقم سرى جديد ',
                        style: TextStyle(
                          fontFamily: 'Barada Reqa',
                          fontSize: 30,
                          color: const Color.fromRGBO(206, 86, 139, 1.0),
                          shadows: [
                            Shadow(
                              color: Color(0x29000000),
                              offset: Offset(5, 5),
                              blurRadius: 6,
                            )
                          ],
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      'يجب ان يكون الرقم السري الجديد مختلف عن الرقم القديم ',
                      style: TextStyle(
                        fontFamily: 'Barada Reqa',
                        fontSize: 20,
                        color: const Color.fromRGBO(206, 86, 139, 1.0),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                    const Padding(
                      padding: EdgeInsets.only(left: 220),
                      child: Text(
                        'الرقم السري ',
                        style: TextStyle(
                          fontFamily: 'Barada Reqa',
                          fontSize: 18,
                          color: const Color.fromRGBO(206, 86, 139, 1.0),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: const Color.fromRGBO(253, 220, 230, 1.0),
                        borderRadius: BorderRadius.circular(70.0),
                      ),
                      child: TextFormField(
                        cursorColor: Colors.grey,
                        obscureText: ishidden,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: IconButton(
                              onPressed: () {
                                setState(() {
                                  ishidden = !ishidden;
                                });
                              },
                              icon: ishidden
                                  ? Image.asset(
                                'assets/images/hidden.png',
                                fit: BoxFit.contain,
                                width: 25,
                              ) : Icon(Icons.remove_red_eye,color: Colors.black45),
                            )),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Padding(
                        padding: EdgeInsets.only(left: 90),
                        child: Text(
                          'يرجى كتابة على الاقل ثمانية احرف',
                          style: TextStyle(
                            fontFamily: 'Barada Reqa',
                            fontSize: 16,
                            color: Color.fromRGBO(206, 86, 139, 1.0),
                          ),
                          textAlign: TextAlign.center,
                        )),
                    SizedBox(
                      height: 20.0,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 200),
                      child: Text(
                        'تاكيد الرقم السر',
                        style: TextStyle(
                          fontFamily: 'Barada Reqa',
                          fontSize: 18,
                          color: Color.fromRGBO(206, 86, 139, 1.0),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset:
                            const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: const Color.fromRGBO(253, 220, 230, 1.0),
                        borderRadius: BorderRadius.circular(70.0),
                      ),
                      child: TextFormField(
                        cursorColor: Colors.grey,
                        obscureText: ishidden,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: IconButton(
                              onPressed: () {
                                setState(() {
                                  ishidden = !ishidden;
                                });
                              },
                              icon: ishidden
                                  ? Image.asset(
                                'assets/images/hidden.png',
                                fit: BoxFit.contain,
                                width: 25,
                              ) :Icon(Icons.remove_red_eye, color: Colors.black45,) ,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                      child: const Text(
                        'اعاده تعين الرقم السري',
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 25,
                          color: Color(0xffffffff),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromRGBO(250, 172, 195, 1.0),
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(70.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget background() {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(249, 157, 185, 1.0),
              Color.fromRGBO(253, 220, 230, 1.0)
            ]),
      ),
    );
  }
}