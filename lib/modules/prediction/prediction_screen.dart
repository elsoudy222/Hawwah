import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hawwah/layout/cubit/home_cubit.dart';
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

    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {

        if (state is SuccessPredictionDataState) {
          navigateTo(
              context,
              PredictionResultScreen(
                text: HomeCubit.get(context).prediction.toString(),
              ));
        }
        if (state is ErrorPredictionDataState){
          showToast(text: 'برجاء التاكد من البيانات', state: ToastStates.ERROR);
        }
      },
      builder: (context, state) {
        var formKey = GlobalKey<FormState>();
        TextEditingController area_meanController = TextEditingController();
        TextEditingController texture_meanController = TextEditingController();
        TextEditingController concavity_meanController = TextEditingController();
        TextEditingController texture_seController = TextEditingController();
        TextEditingController area_seController = TextEditingController();
        TextEditingController concavity_seController = TextEditingController();
        TextEditingController symmetry_seController = TextEditingController();
        TextEditingController smoothness_worstController = TextEditingController();
        TextEditingController concavity_worstController = TextEditingController();
        TextEditingController symmetry_worstController = TextEditingController();
        TextEditingController fractal_dimension_worstController = TextEditingController();
        return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Center(
                  child: Stack(
                    children: [
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'التحليل',
                              style: TextStyle(
                                fontSize: 50,
                                color: Color.fromRGBO(206, 86, 139, 1),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                              offset: const Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                          color: const Color.fromRGBO(
                                              253, 220, 230, 1.0),
                                          borderRadius: BorderRadius.circular(11.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: TextFormField(
                                            validator: (String? value) {
                                              if (value!.isEmpty) {
                                                return 'من فضلك ادخل البيانات المطلوبه';
                                              }
                                            },
                                            keyboardType: TextInputType.number,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 21),
                                            controller: area_meanController,
                                            onFieldSubmitted: (value) {
                                              value = area_meanController.text;
                                            },
                                            decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "area_mean",
                                                hintStyle: TextStyle(
                                                    fontSize: 17,
                                                    color: Color.fromRGBO(
                                                        112, 73, 90, 1))),
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
                                              offset: const Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                          color: const Color.fromRGBO(
                                              253, 220, 230, 1.0),
                                          borderRadius: BorderRadius.circular(11.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: TextFormField(
                                            validator: (String? value) {
                                              if (value!.isEmpty) {
                                                return 'من فضلك ادخل البيانات المطلوبه';
                                              }
                                            },
                                            keyboardType: TextInputType.number,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 20),
                                            controller: texture_meanController,
                                            onFieldSubmitted: (value) {
                                              value = texture_meanController.text;
                                            },
                                            decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "texture_mean",
                                                hintStyle: TextStyle(
                                                    fontSize: 17,
                                                    color: Color.fromRGBO(
                                                        112, 73, 90, 1))),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                              offset: const Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                          color: const Color.fromRGBO(
                                              253, 220, 230, 1.0),
                                          borderRadius: BorderRadius.circular(11.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: TextFormField(
                                            validator: (String? value) {
                                              if (value!.isEmpty) {
                                                return 'من فضلك ادخل البيانات المطلوبه';
                                              }
                                            },
                                            keyboardType: TextInputType.number,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 22),
                                            controller: texture_seController,
                                            onFieldSubmitted: (value) {
                                              value = texture_seController.text;
                                            },
                                            decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "texture_se",
                                                hintStyle: TextStyle(
                                                    fontSize: 17,
                                                    color: Color.fromRGBO(
                                                        112, 73, 90, 1))),
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
                                              offset: const Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                          color: const Color.fromRGBO(
                                              253, 220, 230, 1.0),
                                          borderRadius: BorderRadius.circular(11.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: TextFormField(
                                            validator: (String? value) {
                                              if (value!.isEmpty) {
                                                return 'من فضلك ادخل البيانات المطلوبه';
                                              }
                                            },
                                            keyboardType: TextInputType.number,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 21),
                                            controller: concavity_meanController,
                                            onFieldSubmitted: (value) {
                                              value = concavity_meanController.text;
                                            },
                                            decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "concavity_mean",
                                                hintStyle: TextStyle(
                                                    fontSize: 17,
                                                    color: Color.fromRGBO(
                                                        112, 73, 90, 1))),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                              offset: const Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                          color: const Color.fromRGBO(
                                              253, 220, 230, 1.0),
                                          borderRadius: BorderRadius.circular(11.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: TextFormField(
                                            validator: (String? value) {
                                              if (value!.isEmpty) {
                                                return 'من فضلك ادخل البيانات المطلوبه';
                                              }
                                            },
                                            keyboardType: TextInputType.number,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 21),
                                            controller: concavity_seController,
                                            onFieldSubmitted: (value) {
                                              value = concavity_seController.text;
                                            },
                                            decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "concavity_se",
                                                hintStyle: TextStyle(
                                                    fontSize: 17,
                                                    color: Color.fromRGBO(
                                                        112, 73, 90, 1))),
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
                                              offset: const Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                          color: const Color.fromRGBO(
                                              253, 220, 230, 1.0),
                                          borderRadius: BorderRadius.circular(11.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: TextFormField(
                                            validator: (String? value) {
                                              if (value!.isEmpty) {
                                                return 'من فضلك ادخل البيانات المطلوبه';
                                              }
                                            },
                                            keyboardType: TextInputType.number,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 22),
                                            controller: area_seController,
                                            onFieldSubmitted: (value) {
                                              value = area_seController.text;
                                            },
                                            decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "area_se",
                                                hintStyle: TextStyle(
                                                    fontSize: 17,
                                                    color: Color.fromRGBO(
                                                        112, 73, 90, 1))),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                              offset: const Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                          color: const Color.fromRGBO(
                                              253, 220, 230, 1.0),
                                          borderRadius: BorderRadius.circular(11.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: TextFormField(
                                            validator: (String? value) {
                                              if (value!.isEmpty) {
                                                return 'من فضلك ادخل البيانات المطلوبه';
                                              }
                                            },
                                            keyboardType: TextInputType.number,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 21),
                                            controller: smoothness_worstController,
                                            onFieldSubmitted: (value) {
                                              value =
                                                  smoothness_worstController.text;
                                            },
                                            decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "smoothness_worst",
                                                hintStyle: TextStyle(
                                                    fontSize: 14,
                                                    color: Color.fromRGBO(
                                                        112, 73, 90, 1))),
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
                                              offset: const Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                          color: const Color.fromRGBO(
                                              253, 220, 230, 1.0),
                                          borderRadius: BorderRadius.circular(11.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: TextFormField(
                                            validator: (String? value) {
                                              if (value!.isEmpty) {
                                                return 'من فضلك ادخل البيانات المطلوبه';
                                              }
                                            },
                                            keyboardType: TextInputType.number,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 22),
                                            controller: symmetry_seController,
                                            onFieldSubmitted: (value) {
                                              value = symmetry_seController.text;
                                            },
                                            decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "symmetry_se",
                                                hintStyle: TextStyle(
                                                    fontSize: 14,
                                                    color: Color.fromRGBO(
                                                        112, 73, 90, 1))),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                              offset: const Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                          color: const Color.fromRGBO(
                                              253, 220, 230, 1.0),
                                          borderRadius: BorderRadius.circular(11.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: TextFormField(
                                            validator: (String? value) {
                                              if (value!.isEmpty) {
                                                return 'من فضلك ادخل البيانات المطلوبه';
                                              }
                                            },
                                            keyboardType: TextInputType.number,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 21),
                                            controller: symmetry_worstController,
                                            onFieldSubmitted: (value) {
                                              value = symmetry_worstController.text;
                                            },
                                            decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "symmetry_worst",
                                                hintStyle: TextStyle(
                                                    fontSize: 14,
                                                    color: Color.fromRGBO(
                                                        112, 73, 90, 1))),
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
                                              offset: const Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                          color: const Color.fromRGBO(
                                              253, 220, 230, 1.0),
                                          borderRadius: BorderRadius.circular(11.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: TextFormField(
                                            validator: (String? value) {
                                              if (value!.isEmpty) {
                                                return 'من فضلك ادخل البيانات المطلوبه';
                                              }
                                            },
                                            keyboardType: TextInputType.number,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 22),
                                            controller: concavity_worstController,
                                            onFieldSubmitted: (value) {
                                              value =
                                                  concavity_worstController.text;
                                            },
                                            decoration: const InputDecoration(
                                                border: InputBorder.none,
                                                hintText: "concavity_worst",
                                                hintStyle: TextStyle(
                                                    fontSize: 14,
                                                    color: Color.fromRGBO(
                                                        112, 73, 90, 1))),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
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
                                          offset: const Offset(
                                              0, 3), // changes position of shadow
                                        ),
                                      ],
                                      color:
                                      const Color.fromRGBO(253, 220, 230, 1.0),
                                      borderRadius: BorderRadius.circular(11.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: TextFormField(
                                        validator: (String? value) {
                                          if (value!.isEmpty) {
                                            return 'من فضلك ادخل البيانات المطلوبه';
                                          }
                                        },
                                        keyboardType: TextInputType.number,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 22),
                                        controller:
                                        fractal_dimension_worstController,
                                        onFieldSubmitted: (value) {
                                          value = fractal_dimension_worstController
                                              .text;
                                        },
                                        decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "fractal_dimension_worst",
                                            hintStyle: TextStyle(
                                                fontSize: 14,
                                                color: Color.fromRGBO(
                                                    112, 73, 90, 1))),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            (state is! LoadingPredictionDataState)
                                ? ElevatedButton(
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
                                if (formKey.currentState!.validate()) {
                                  HomeCubit.get(context).sendPredictionData(
                                    texture_mean: texture_meanController.text,
                                    area_mean: area_meanController.text,
                                    concavity_mean: concavity_meanController.text,
                                    texture_se: texture_seController.text,
                                    area_se: area_seController.text,
                                    concavity_se: concavity_seController.text,
                                    symmetry_se: symmetry_seController.text,
                                    smoothness_worst: smoothness_worstController.text,
                                    concavity_worst: concavity_worstController.text,
                                    symmetry_worst: symmetry_worstController.text,
                                    fractal_dimension_worst: fractal_dimension_worstController.text,
                                  );
                                }
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
                            )
                                : const Center(child: CircularProgressIndicator()),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
