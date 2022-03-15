import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _bottomNavigationBarColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //
          background(),
          profileCircle(),
          Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [ const SizedBox(
                  height: 20,
                ),
                  Padding(padding: EdgeInsets.all(5),
                    child:   GestureDetector(
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios_sharp,
                            size: 40,
                            color: Colors.white,
                          ),

                        ],
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'اسم المستخدم ',
                    style: TextStyle(
                      fontFamily: 'Barada Reqa',
                      fontSize: 30,
                      color: Color(0xffffffff),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  CircleAvatar(
                    backgroundColor: const Color.fromRGBO(206, 86, 139, 1),
                    minRadius: 50,
                    // child: Image.asset(
                    //   'assets/images/Group 31.png',
                    //   fit: BoxFit.contain,
                    //   width: 110,
                    // ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: const Color.fromRGBO(249, 192, 209, 1),
                      borderRadius: BorderRadius.circular(70.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: const Color.fromRGBO(249, 192, 209, 1),
                      borderRadius: BorderRadius.circular(70.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: const Color.fromRGBO(249, 192, 209, 1),
                      borderRadius: BorderRadius.circular(70.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: const Color.fromRGBO(249, 192, 209, 1),
                      borderRadius: BorderRadius.circular(70.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: const Color.fromRGBO(249, 192, 209, 1),
                      borderRadius: BorderRadius.circular(70.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  TextButton(
                    onPressed: () {},
                    child: Center(
                      child: Container(
                        width: 100,
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(250, 172, 195, 1),
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
                  )
                ],
              ))
        ],
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

  Widget profileCircle() {
    return Positioned(
      child: Container(
        width: 545,
        height: 507,
        decoration: const BoxDecoration(
            color: Color.fromRGBO(206, 86, 139, 1), shape: BoxShape.circle),
      ),
      top: -230,
      right: -80,
    );
  }

}