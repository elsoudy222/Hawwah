import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hawwah/shared/components/components.dart';

import 'prediction_result_screen.dart';


class PredictionScreen extends StatefulWidget {
  const PredictionScreen({Key? key}) : super(key: key);

  @override
  _PredictionScreenState createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Center(
            child: Stack(
              children: [
                _background(),
                _body(),
              ],
            ),
          ),
        ));
  }

  Widget _body() {
    TextEditingController area_meanController;
    TextEditingController texture_meanController;
    TextEditingController concavity_meanController = TextEditingController();
    TextEditingController texture_seController = TextEditingController();
    TextEditingController area_seController = TextEditingController();
    TextEditingController concavity_seController = TextEditingController();
    TextEditingController symmetry_seController = TextEditingController();
    TextEditingController smoothness_worstController = TextEditingController();
    TextEditingController concavity_worstController = TextEditingController();
    TextEditingController symmetry_worstController = TextEditingController();
    TextEditingController fractal_dimension_worstController =
        TextEditingController();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'التحليل',
            style: TextStyle(
              fontSize: 50,
              color: Color.fromRGBO(206, 86, 139, 1),
            ),
            textAlign: TextAlign.center,
          ),
          Form(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                      width: 140,
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
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 21),
                         // controller: area_meanController,
                          onSaved: (value) {
                          //  value = area_meanController.text;
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "area_mean",
                              hintStyle: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromRGBO(112, 73, 90, 1))),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 140,
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
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 22),
                         // controller: texture_meanController,
                          onSaved: (value) {
                           // value = texture_meanController.text;
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "texture_mean",
                              hintStyle: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromRGBO(112, 73, 90, 1))),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                      width: 140,
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
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 22),
                          controller: texture_seController,
                          onSaved: (value) {
                            value = texture_seController.text;
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "texture_se",
                              hintStyle: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromRGBO(112, 73, 90, 1))),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 140,
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
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 21),
                          controller: concavity_meanController,
                          onSaved: (value) {
                            value = concavity_meanController.text;
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "concavity_mean",
                              hintStyle: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromRGBO(112, 73, 90, 1))),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                      width: 140,
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
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 21),
                          controller: concavity_seController,
                          onSaved: (value) {
                            value = concavity_seController.text;
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "concavity_se",
                              hintStyle: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromRGBO(112, 73, 90, 1))),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 140,
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
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 22),
                          controller: area_seController,
                          onSaved: (value) {
                            value = area_seController.text;
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "area_se",
                              hintStyle: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromRGBO(112, 73, 90, 1))),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                      width: 140,
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
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 21),
                          controller: smoothness_worstController,
                          onSaved: (value) {
                            value = smoothness_worstController.text;
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "smoothness_worst",
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(112, 73, 90, 1))),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 140,
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
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 22),
                          controller: symmetry_seController,
                          onSaved: (value) {
                            value = symmetry_seController.text;
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "symmetry_se",
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(112, 73, 90, 1))),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                      width: 140,
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
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 21),
                          controller: symmetry_worstController,
                          onSaved: (value) {
                            value = symmetry_worstController.text;
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "symmetry_worst",
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(112, 73, 90, 1))),
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 140,
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
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 22),
                          controller: concavity_worstController,
                          onSaved: (value) {
                            value = concavity_worstController.text;
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "concavity_worst",
                              hintStyle: TextStyle(
                                  fontSize: 14,
                                  color: Color.fromRGBO(112, 73, 90, 1))),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 50,
                  width: 140,
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
                    borderRadius: BorderRadius.circular(11.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22),
                      controller: fractal_dimension_worstController,
                      onSaved: (value) {
                        value = fractal_dimension_worstController.text;
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "fractal_dimension_worst",
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(112, 73, 90, 1))),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ElevatedButton(
            child: const Text(
              'النتيجه',
              style: TextStyle(
                fontFamily: 'Segoe UI',
                fontSize: 22,
                color: Color(0xffffffff),
                letterSpacing: 3.1,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              navigateToAndFinish(context, PredictionResultScreen());
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                const Color.fromRGBO(206, 86, 139, 1.0),
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


