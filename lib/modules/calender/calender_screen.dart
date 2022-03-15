import 'package:flutter/material.dart';

class CalenderScreen extends StatefulWidget {
  @override
  _CalenderScreenState createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  bool isChecked = false;

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

  var Slected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Stack(
            children: [
              _background(),
              _body(),
            ],
          ),
        ));
  }

  Widget _body() {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
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
                  itemCount: 30,
                  itemBuilder: (BuildContext context, int index) {
                    return _checkItem(index);
                  },
                ),
              ),
              _buttonCalnder(),
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
        ));
  }

  Widget _checkItem(index) {
    return Stack(
      children: [
        Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: isChecked
                ? const Color.fromRGBO(170, 207, 207, 1)
                : Colors.white,
          ),
          child: Center(
            child: Text(
              '${index + 1}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Opacity(
          opacity: 0,
          child: Checkbox(
            checkColor: Colors.white,
            fillColor: MaterialStateProperty.resolveWith(getColor),
            value: isChecked,
            onChanged: (bool ?value) {
              setState(() {
                print(index);
                isChecked = value!;
              });
            },
          ),
        )
      ],
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

  _buttonCalnder() {
    return SizedBox(
      height: 300,
      width: 300,
      child: Stack(
        children: [
          const Center(
            child: Text(
              '  ادخل  تاريخ اول أيام الحيض \n          \"الدوره الشهريه\" ',
              style: TextStyle(color: Colors.white, fontSize: 20, shadows: [
                Shadow(
                    color: Colors.black38,
                    blurRadius: 1.2,
                    offset: Offset(3, 3))
              ]),
            ),
          ),
          IconButton(
            onPressed: () {

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

  _Squareimage() {
    return Stack(
      children: [
        Positioned(
          child: Container(
            height: 660,
            width: MediaQuery.of(context).size.width * 0.96,
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
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
