import 'package:flutter/material.dart';

class PredictionResultScreen extends StatefulWidget {
  const PredictionResultScreen({Key? key}) : super(key: key);

  @override
  _PredictionResultScreenState createState() => _PredictionResultScreenState();
}

class _PredictionResultScreenState extends State<PredictionResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Stack(
            children: [
              _background(),
              Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                          color: Colors.white,
                        ),
                        Text(
                          'التحليل',
                          style: TextStyle(fontSize: 35, color: Colors.white),
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Container(
                      height: 350,
                      width: 350,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/icons/2.png'),fit: BoxFit.cover)),
                      child:Center(child:  Text(
                        'النتيجه ',
                        style: TextStyle(
                          fontFamily: 'Segoe UI',
                          fontSize: 35,
                          color: Color.fromRGBO(206, 86, 139, 1.0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),))
                ],
              )
            ],
          ),
        ));
  }



  Widget _appBar() {
    return Container(
      margin: EdgeInsets.all(5),
      height: 60,
      color: Color.fromRGBO(253, 220, 230, 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text(
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
}