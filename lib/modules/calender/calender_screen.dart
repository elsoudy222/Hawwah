// import 'package:flutter/material.dart';
//
// class CalenderScreen extends StatefulWidget {
//   const CalenderScreen({Key? key}) : super(key: key);
//
//   @override
//   _CalenderScreenState createState() => _CalenderScreenState();
// }
//
// class _CalenderScreenState extends State<CalenderScreen> {
//   bool isChecked = false;
//
//   Color getColor(Set<MaterialState> states) {
//     const Set<MaterialState> interactiveStates = <MaterialState>{
//       MaterialState.pressed,
//       MaterialState.hovered,
//       MaterialState.focused,
//     };
//     if (states.any(interactiveStates.contains)) {
//       return Colors.blue;
//     }
//     return Colors.red;
//   }
//
//   // ignore: non_constant_identifier_names
//   var Slected;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SingleChildScrollView(
//           physics: const BouncingScrollPhysics(),
//           child: Stack(
//             children: [
//               _background(),
//               _body(),
//             ],
//           ),
//         ));
//   }
//
//   Widget _body() {
//     return Directionality(
//         textDirection: TextDirection.rtl,
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//
//
//               const SizedBox(
//                 height: 30,
//               ),
//               SizedBox(
//                 height: 45,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: 30,
//                   itemBuilder: (BuildContext context, int index) {
//                     return _checkItem(index);
//                   },
//                 ),
//               ),
//               _buttonCalnder(),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Row(
//                   children: [
//                     Container(
//                       height: 35,
//                       width: 35,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         color: const Color.fromRGBO(170, 207, 207, 1),
//                       ),
//                     ),
//                     const Text(
//                       ' اليوم',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontFamily: 'Segoe UI',
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold),
//                     ),
//                     const SizedBox(
//                       width: 75,
//                     ),
//                     Container(
//                       height: 35,
//                       width: 35,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         color: const Color.fromRGBO(239, 79, 147, 1),
//                       ),
//                     ),
//                     const Text(
//                       'يوم الفحص',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontFamily: 'Segoe UI',
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 3,
//               ),
//               _Squareimage(),
//               const SizedBox(
//                 height: 23,
//               ),
//             ],
//           ),
//         ));
//   }
//
//   Widget _checkItem(index) {
//     return Stack(
//       children: [
//         Container(
//           height: 35,
//           width: 35,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5),
//             color: isChecked
//                 ? const Color.fromRGBO(170, 207, 207, 1)
//                 : Colors.white,
//           ),
//           child: Center(
//             child: Text(
//               '${index + 1}',
//               style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//         Opacity(
//           opacity: 0,
//           child: Checkbox(
//             checkColor: Colors.white,
//             fillColor: MaterialStateProperty.resolveWith(getColor),
//             value: isChecked,
//             onChanged: (bool ?value) {
//               setState(() {
//                 print(index);
//                 isChecked = value!;
//               });
//             },
//           ),
//         )
//       ],
//     );
//   }
//
//   _background() {
//     return Container(
//       width: double.infinity,
//       height: MediaQuery.of(context).size.height,
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               Color.fromRGBO(248, 157, 185, 1.0),
//               Color.fromRGBO(250, 250, 250, 1.0)
//             ]),
//       ),
//     );
//   }
//
//   _buttonCalnder() {
//     return SizedBox(
//       height: 300,
//       width: 300,
//       child: Stack(
//         children: [
//           const Center(
//             child: Text(
//               '  ادخل  تاريخ اول أيام الحيض \n          \"الدوره الشهريه\" ',
//               style: TextStyle(color: Colors.white, fontSize: 20, shadows: [
//                 Shadow(
//                     color: Colors.black38,
//                     blurRadius: 1.2,
//                     offset: Offset(3, 3))
//               ]),
//             ),
//           ),
//           IconButton(
//             onPressed: () {
//
//             },
//             icon: Image.asset(
//               'assets/images/calender/circle_logo.png',
//               width: 350,
//               height: 350,
//             ),
//             iconSize: 400,
//           ),
//         ],
//       ),
//     );
//   }
//
//   _Squareimage() {
//     return Stack(
//       children: [
//         Positioned(
//           child: Container(
//             height: 660,
//             width: MediaQuery.of(context).size.width * 0.96,
//             margin: EdgeInsets.all(5),
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(25),
//                 color: Color.fromRGBO(253, 220, 230, 1)),
//             child: Opacity(
//               opacity: 0.3,
//               child: Image.asset('assets/images/calender/calender_background.png'),
//             ),
//           ),
//           top: 160,
//         ),
//         Positioned(
//           child: Container(
//             margin: const EdgeInsets.all(10),
//             height: 300,
//             width: 300,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/images/cloud.png'),
//               ),
//             ),
//             child: const Center(
//               child: Text(
//                 '  متى يجب إجراء \nالفحص الذاتى ؟ ',
//                 style: TextStyle(
//                     fontSize: 22,
//                     fontFamily: 'Segoe UI',
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromRGBO(206, 86, 139, 1)),
//               ),
//             ),
//           ),
//           top: -10,
//           left: 93,
//         ),
//         Column(
//           children: const [
//             SizedBox(
//               height: 260,
//             ),
//             Padding(
//               padding: EdgeInsets.all(15),
//               child: Text(
//                 '  يجب اجراء الفحص الذاتي \n بعد الانتهاء من فترة الحيض كل شهر  (في اليوم السابع الي اليوم العاشر من الحيض)',
//                 style: TextStyle(
//                     fontSize: 22,
//                     fontFamily: 'Segoe UI',
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromRGBO(206, 86, 139, 1)),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(15),
//               child: Text(
//                 'في حالة وجود رضاعة طبيعية يتم اجراء  الفحص بعد فترة الرضاعة عندما يكون  الثدي فارغاً من الحليب',
//                 style: TextStyle(
//                     fontSize: 22,
//                     fontFamily: 'Segoe UI',
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromRGBO(206, 86, 139, 1)),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.all(15),
//               child: Text(
//                 'في حالة انقطاع الحيض بشكل مؤقت  او دائم (الحمل او سن اليأس) يتم تحديد يوم حسب الرغبة خلال الشهر علي سبيل المثال  اليوم الأول من كل شهر ',
//                 style: TextStyle(
//                     fontSize: 22,
//                     fontFamily: 'Segoe UI',
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromRGBO(206, 86, 139, 1)),
//               ),
//             ),
//           ],
//         )
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hawwah/modules/calender/model.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({Key? key}) : super(key: key);

  @override
  _CalenderScreenState createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  var dayController = TextEditingController();

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Stack(

            children: [
              //_background(),
              _body(),
            ],
          ),
        ));
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 45,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: days.length,
              itemBuilder: (BuildContext context, int index) {
                return _checkItem(index);
              },
            ),
          ),
          _buttonCalender(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromRGBO(170, 207, 207, 1),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  ' اليوم',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Segoe UI',
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 75,
                ),
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromRGBO(239, 79, 147, 1),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'يوم الفحص',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Segoe UI',
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          _Squareimage(),
          const SizedBox(
            height: 23,
          ),
        ],
      ),
    );
  }


  Widget _checkItem(index) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 35,
        width: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: days[index].color,
        ),
        child: Center(
          child: Text(
            '${days[index].title}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  _buttonCalender() {
    return SizedBox(
      height: 300,
      width: 300,
      child: Stack(
        children: [
          const Center(
            child: Text(
              '  ادخل  تاريخ اول أيام الحيض \n          \"الدوره الشهريه\" ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                shadows: [
                  Shadow(
                      color: Colors.black38,
                      blurRadius: 1.2,
                      offset: Offset(3, 3)),
                ],
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              dialog(context);
            },
            icon: Image.asset(
              'assets/images/calender/circle_logo.png',
              width: 350,
              height: 350,
            ),
            iconSize: 400,
          ),
        ],
      ),
    );
  }

  void dialog(BuildContext context, {Day? day}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          content: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(248, 157, 185, 1.0),
                    Color.fromRGBO(250, 250, 250, 1.0)
                  ]),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                          onTap: () {
                            dayController.clear();
                            int i = 0;
                            for (i; i < days.length; i++) {
                              if (days[i].isChecked == true) {
                                setState(() {
                                  days[i].color = Colors.white;
                                  if (i + 1 >= days.length) {
                                    days[days.length-days.length].color = Colors.white;
                                  } else {
                                    days[i + 1].color = Colors.white;
                                  }
                                  if (i + 2 >= days.length) {
                                    print((i+2)-days.length);
                                    days[(i+2)-days.length].color = Colors.white;
                                  } else {
                                    days[i + 2].color = Colors.white;
                                  }
                                  if (i + 3 >= days.length) {
                                    print((i+3)-days.length);
                                    days[(i+3)-days.length].color = Colors.white;
                                  } else {
                                    days[i + 3].color = Colors.white;
                                  }
                                  if (i + 4 >= days.length) {
                                    print((i+4)-days.length);
                                    days[(i+4)-days.length].color = Colors.white;
                                  } else {
                                    days[i + 4].color = Colors.white;
                                  }
                                  if (i + 5 >= days.length) {
                                    print((i+5)-days.length);
                                    days[(i+5)-days.length].color = Colors.white;
                                  } else {
                                    days[i + 5].color = Colors.white;
                                  }
                                  if (i + 6 >= days.length) {
                                    print((i+6)-days.length);
                                    days[(i+6)-days.length].color = Colors.white;
                                  } else {
                                    days[i + 6].color = Colors.white;
                                  }
                                  if (i + 7 >= days.length) {
                                    print((i+7)-days.length);
                                    days[(i+7)-days.length].color = Colors.white;
                                  } else {
                                    days[i + 7].color = Colors.white;
                                  }
                                });
                              }
                            }
                          },
                          child: const Icon(
                            Icons.restart_alt_outlined,
                            size: 40,
                            color: Colors.white,
                          )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
                const Center(
                  child: Text(
                    '  ادخل  تاريخ اول أيام الحيض \n          \"الدوره الشهريه\" ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      shadows: [
                        Shadow(
                            color: Colors.black38,
                            blurRadius: 1.2,
                            offset: Offset(3, 3)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .2,
                  child: TextFormField(
                    controller: dayController,
                    keyboardType: TextInputType.number,
                    maxLength: 2,
                    cursorColor: Colors.white,
                    style: const TextStyle(color: Colors.white),
                    onFieldSubmitted: (value) {
                      int i = 0;
                      setState(() {
                        for (i; i < days.length; i++) {
                          if (value.toString() == days[i].title) {
                            days[i].isChecked = true;
                            days[i].color = Color.fromRGBO(170, 207, 207, 1);
                            if (i + 8 >= days.length) {
                              days[days.length-days.length].color = Color.fromRGBO(239, 79, 147, 1);
                            } else {
                              days[i + 8].color = Color.fromRGBO(239, 79, 147, 1);
                            }
                            if (i + 9 >= days.length) {
                              print((i+9)-days.length);
                              days[(i+9)-days.length].color = Color.fromRGBO(239, 79, 147, 1);
                            } else {
                              days[i + 9].color = Color.fromRGBO(239, 79, 147, 1);
                            }
                            if (i + 3 >= days.length) {
                              print((i+3)-days.length);
                              days[(i+3)-days.length].color = Color.fromRGBO(239, 79, 147, 1);
                            } else {
                              days[i + 3].color = Color.fromRGBO(239, 79, 147, 1);
                            }
                            if (i + 4 >= days.length) {
                              print((i+4)-days.length);
                              days[(i+4)-days.length].color = Color.fromRGBO(239, 79, 147, 1);
                            } else {
                              days[i + 4].color = Color.fromRGBO(239, 79, 147, 1);
                            }
                            if (i + 5 >= days.length) {
                              print((i+5)-days.length);
                              days[(i+5)-days.length].color = Color.fromRGBO(239, 79, 147, 1);
                            } else {
                              days[i + 5].color = Color.fromRGBO(239, 79, 147, 1);
                            }
                            if (i + 6 >= days.length) {
                              print((i+6)-days.length);
                              days[(i+6)-days.length].color = Color.fromRGBO(239, 79, 147, 1);
                            } else {
                              days[i + 6].color = Color.fromRGBO(239, 79, 147, 1);
                            }
                            if (i + 7 >= days.length) {
                              print((i+7)-days.length);
                              days[(i+7)-days.length].color = Color.fromRGBO(239, 79, 147, 1);
                            } else {
                              days[i + 7].color = Color.fromRGBO(239, 79, 147, 1);
                            }
                          }
                        }
                      });
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(26, 14, 4, 14),
                      filled: true,
                      fillColor: const Color.fromRGBO(248, 157, 185, 1.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(248, 157, 185, 1.0),
                            width: 0.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Color.fromRGBO(248, 157, 185, 1.0),
                            width: 0.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          contentPadding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        );
      },
    );
  }

  Widget _appBar() {
    return Container(
      margin: EdgeInsets.all(5),
      height: 60,
      color: Color.fromRGBO(253, 220, 230, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/menu.png',
              fit: BoxFit.contain,
              width: 60,
              height: 60,
            ),
            iconSize: 50,
          ),
          const Text(
            'حَوَّاء ',
            style:
            TextStyle(fontSize: 35, color: Color.fromRGBO(206, 86, 139, 1)),
          ),
        ],
      ),
    );
  }

  _background() {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(248, 157, 185, 1.0),
              Color.fromRGBO(250, 250, 250, 1.0)
            ]),
      ),
    );
  }

  _Squareimage() {
    return Stack(
      children: [
        Positioned(
          child: Container(
            height: 550,
            width: MediaQuery.of(context).size.width * 0.96,
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.pink),
                color: Color.fromRGBO(253, 220, 230, 1)),
            child: Opacity(
              opacity: 0.3,
              child: Image.asset('assets/images/calender/calender_background.png'),
            ),
          ),
          top: 160,
        ),
        Positioned(
          child: Container(
            margin: const EdgeInsets.all(10),
            height: 300,
            width: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/cloud.png'),
              ),
            ),
            child: const Center(
              child: Text(
                '  متى يجب إجراء \nالفحص الذاتى ؟ ',
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Segoe UI',
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(206, 86, 139, 1)),
              ),
            ),
          ),
          top: -10,
          left: 93,
        ),
        Column(
          children: const [
            SizedBox(
              height: 260,
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                '  يجب اجراء الفحص الذاتي \n بعد الانتهاء من فترة الحيض كل شهر  (في اليوم السابع الي اليوم العاشر من الحيض)',
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Segoe UI',
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(206, 86, 139, 1)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'في حالة وجود رضاعة طبيعية يتم اجراء  الفحص بعد فترة الرضاعة عندما يكون  الثدي فارغاً من الحليب',
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Segoe UI',
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(206, 86, 139, 1)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                'في حالة انقطاع الحيض بشكل مؤقت  او دائم (الحمل او سن اليأس) يتم تحديد يوم حسب الرغبة خلال الشهر علي سبيل المثال  اليوم الأول من كل شهر ',
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'Segoe UI',
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(206, 86, 139, 1)),
              ),
            ),
          ],
        )
      ],
    );
  }
}
