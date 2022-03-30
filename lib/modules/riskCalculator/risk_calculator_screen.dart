import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hawwah/modules/riskCalculator/risk_result_screen.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/components/components.dart';

import '../../layout/cubit/home_cubit.dart';

class RiskCalculatorScreen extends StatefulWidget {
  const RiskCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<RiskCalculatorScreen> createState() => _RiskCalculatorScreenState();
}

class _RiskCalculatorScreenState extends State<RiskCalculatorScreen> {
  var ageController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  // List of Questions :
  String Q2 = "كم كان سن المرأة في أول حيض لها؟";
  String Q3 = "كم كان عمر المرأة وقت ولادت الطفل الاول؟";
  String Q4 = "هل سبق للمرأة أن خضعت لأخذ عينة من الثدى؟";
  String Q5 = "كم عدد عينات الثدي (الإيجابية أو السلبية)التي خضعت لها المرأه؟";
  String Q6 = "هل خضعت المرأه لخزعة ثدى واحدة على الأقل مصحوبه بتضخم غير منطقى؟";
  String Q7 = "كم عدد اقارب المرأة من الدرجة الأولى(أم - اخوات - اطفال بنات)مصابات بسرطان الثدي؟";
  String Q8 = "ما هو جنس / عرق المرأة؟";

  // List of Answers :
  List<Map<String, dynamic>> answer2 = [
    {'value': 0, 'label': "لا أعلم"},
    {'value': 1, 'label': "من 7 الى 11"},
    {'value': 2, 'label': "من 12 ال 13"},
    {'value': 3, 'label': "14 أو أكثر"},
  ];
  List<Map<String, dynamic>> answer3 = [
    {'value': 0, 'label': "لا أعلم"},
    {'value': 1, 'label': "لم ألد"},
    {'value': 2, 'label': "أقل من 20"},
    {'value': 3, 'label': "من 20 الى 24"},
    {'value': 4, 'label': "من 25 الى 29"},
    {'value': 5, 'label': "30أو أكثر"},
  ];
  List<Map<String, dynamic>> answer4 = [
    {'value': 0, 'label': "لا أعلم"},
    {'value': 1, 'label': "نعم"},
    {'value': 2, 'label': "لا"},
  ];
  List<Map<String, dynamic>> answer5 = [
    {'value': 0, 'label': "لا أعلم"},
    {'value': 1, 'label': "0"},
    {'value': 2, 'label': "1"},
    {'value': 3, 'label': "أكثر من 1"},
  ];
  List<Map<String, dynamic>> answer6 = [
    {'value': 0, 'label': "لا أعلم"},
    {'value': 1, 'label': "نعم"},
    {'value': 2, 'label': "لا"},
  ];
  List<Map<String, dynamic>> answer7 = [
    {'value': 0, 'label': "لا أعلم"},
    {'value': 1, 'label': "0"},
    {'value': 2, 'label': "1"},
    {'value': 3, 'label': "أكثر من 1"},
  ];
  List<Map<String, dynamic>> answer8 = [
    {'value': 0, 'label': "لا أعلم"},
    {'value': 1, 'label': "أبيض"},
    {'value': 2, 'label': "أفريقى"},
    {'value': 3, 'label': "اصول اسبانية"},
    {'value': 4, 'label': 'هندى'},
  ];
  List<Map<String, dynamic>> items = [
    {'value': 5, 'label': 'أسيوى'},
    {'value': 6, 'label': 'صيني'},
    {'value': 7, 'label': 'ياباني'},
    {'value': 8, 'label': 'فلبيني'},
    {'value': 9, 'label': 'هاواي'},
    {'value': 10, 'label': 'جزر المحيط الهادئ الاخري'},
    {'value': 11, 'label': 'أمريكي اسيوي اخر'},
  ];
  String selectAnswerQ1 = "";
  int selectAnswerValueQ1 = 0;
  String selectAnswerQ2 = "";
  int? selectAnswerValueQ2 = 0;
  String selectAnswerQ3 = "";
  int? selectAnswerValueQ3 = 0;
  String selectAnswerQ4 = "";
  int? selectAnswerValueQ4 = 0;
  String selectAnswerQ5 = "";
  int? selectAnswerValueQ5 = 0;
  String selectAnswerQ6 = "";
  int? selectAnswerValueQ6 = 0;
  String selectAnswerQ7 = "";
  int? selectAnswerValueQ7 = 0;
  String selectAnswerQ8 = "";
  int? selectAnswerValueQ8 = 0;
  bool isSelect = false;

  onPressed()async{
    if(ageController.text ==''){
      showToast(text: 'من فضلك ادخل العمر', state: ToastStates.ERROR);
    }else{
      int age =int.parse(ageController.value.text);
      if(age>85||age <35 ){
        showToast(text: 'العمر من 35 الي 85', state: ToastStates.ERROR);
        print("ff ${ageController.value.text}");
      }else{
        HomeCubit.get(context).sendRiskData(
          age: age,
          menarch_age: selectAnswerValueQ2!,
          live_birth_age: selectAnswerValueQ3!,
          ever_had_biopsy: selectAnswerValueQ4!,
          num_biopsy: selectAnswerValueQ5!,
          first_deg_relatives: selectAnswerValueQ6!,
          ihyp: selectAnswerValueQ7!,
          race: selectAnswerValueQ8!,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is SuccessRiskDataState) {
          navigateTo(
              context,
              RiskResultScreen(
                  result: HomeCubit.get(context).riskModel!.results!.lifetimeAbs));
        }
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      border: Border.all(color: Colors.white, width: 1.5),
                      borderRadius: BorderRadius.circular(20)),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          padding: const EdgeInsets.all(10),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "ما هو سن المرأة؟",
                                style: TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.pink,
                                ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      border: Border.all(color: Colors.pink)),
                                  child: defaultFormField(
                                      controller: ageController,
                                      keyboardType: TextInputType.number,
                                      prefix: Icons.accessibility,
                                      hintText: 'العمر من 35 الي 85',
                                  ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Divider(
                          thickness: 1.5,
                          height: 1.5,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Q2,
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.pink,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Center(
                                        child: Wrap(
                                          alignment: WrapAlignment.center,
                                          spacing: 15,
                                          children: answer2.map((answers) {
                                            bool isSelected = selectAnswerQ2 ==
                                                answers['label'];
                                            final forgroundColor = isSelected
                                                ? Colors.white
                                                : Colors.pink;
                                            final backgroundColor = isSelected
                                                ? primaryColor
                                                : secondaryColor;
                                            return GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  selectAnswerQ2 =
                                                      answers['label'];
                                                  selectAnswerValueQ2 =
                                                      answers['value'];
                                                  isSelect = false;
                                                });
                                                print(selectAnswerValueQ2);
                                                print(selectAnswerQ2);
                                              },
                                              child: Chip(
                                                shape: const StadiumBorder(
                                                    side: BorderSide(
                                                        color: Colors.pink)),
                                                label: Text(
                                                  answers['label'],
                                                  style: TextStyle(
                                                    color: forgroundColor,
                                                  ),
                                                ),
                                                backgroundColor: backgroundColor,
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 1.5,
                          height: 1.5,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  Q3,
                                  style: const TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.pink,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Center(
                                        child: Wrap(
                                          alignment: WrapAlignment.center,
                                          spacing: 15,
                                          children: answer3.map((answers) {
                                            bool isSelected = selectAnswerQ3 ==
                                                answers['label'];
                                            final forgroundColor = isSelected
                                                ? Colors.white
                                                : Colors.pink;
                                            final backgroundColor = isSelected
                                                ? primaryColor
                                                : secondaryColor;
                                            return GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  selectAnswerQ3 =
                                                      answers['label'];
                                                  selectAnswerValueQ3 =
                                                      answers['value'];
                                                  isSelect = false;
                                                });
                                                print(selectAnswerValueQ3);
                                                print(selectAnswerQ3);
                                              },
                                              child: Chip(
                                                shape: const StadiumBorder(
                                                    side: BorderSide(
                                                        color: Colors.pink)),
                                                label: Text(
                                                  answers['label'],
                                                  style: TextStyle(
                                                    color: forgroundColor,
                                                  ),
                                                ),
                                                backgroundColor: backgroundColor,
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 1.5,
                          height: 1.5,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Q4,
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.pink,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Center(
                                      child: Wrap(
                                        alignment: WrapAlignment.center,
                                        spacing: 15,
                                        children: answer4.map((answers) {
                                          bool isSelected =
                                              selectAnswerQ4 == answers['label'];
                                          final forgroundColor = isSelected
                                              ? Colors.white
                                              : Colors.pink;
                                          final backgroundColor = isSelected
                                              ? primaryColor
                                              : secondaryColor;
                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selectAnswerQ4 = answers['label'];
                                                selectAnswerValueQ4 =
                                                    answers['value'];
                                                isSelect = false;
                                              });
                                              print(selectAnswerValueQ4);
                                              print(selectAnswerQ4);
                                            },
                                            child: Chip(
                                              shape: const StadiumBorder(
                                                  side: BorderSide(
                                                      color: Colors.pink)),
                                              label: Text(
                                                answers['label'],
                                                style: TextStyle(
                                                  color: forgroundColor,
                                                ),
                                              ),
                                              backgroundColor: backgroundColor,
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Divider(
                          thickness: 1.5,
                          height: 1.5,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Q5,
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.pink,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Center(
                                      child: Wrap(
                                        alignment: WrapAlignment.center,
                                        spacing: 15,
                                        children: answer5.map((answers) {
                                          bool isSelected =
                                              selectAnswerQ5 == answers['label'];
                                          final forgroundColor = isSelected
                                              ? Colors.white
                                              : Colors.pink;
                                          final backgroundColor = isSelected
                                              ? primaryColor
                                              : secondaryColor;
                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selectAnswerQ5 = answers['label'];
                                                selectAnswerValueQ5 =
                                                    answers['value'];
                                                isSelect = false;
                                              });
                                              print(selectAnswerValueQ5);
                                              print(selectAnswerQ5);
                                            },
                                            child: Chip(
                                              shape: const StadiumBorder(
                                                  side: BorderSide(
                                                      color: Colors.pink)),
                                              label: Text(
                                                answers['label'],
                                                style: TextStyle(
                                                  color: forgroundColor,
                                                ),
                                              ),
                                              backgroundColor: backgroundColor,
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Divider(
                          thickness: 1.5,
                          height: 1.5,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Q6,
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.pink,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Center(
                                      child: Wrap(
                                        alignment: WrapAlignment.center,
                                        spacing: 15,
                                        children: answer6.map((answers) {
                                          bool isSelected =
                                              selectAnswerQ6 == answers['label'];
                                          final forgroundColor = isSelected
                                              ? Colors.white
                                              : Colors.pink;
                                          final backgroundColor = isSelected
                                              ? primaryColor
                                              : secondaryColor;
                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selectAnswerQ6 = answers['label'];
                                                selectAnswerValueQ6 =
                                                    answers['value'];
                                                isSelect = false;
                                              });
                                              print(selectAnswerValueQ6);
                                              print(selectAnswerQ6);
                                            },
                                            child: Chip(
                                              shape: const StadiumBorder(
                                                  side: BorderSide(
                                                      color: Colors.pink)),
                                              label: Text(
                                                answers['label'],
                                                style: TextStyle(
                                                  color: forgroundColor,
                                                ),
                                              ),
                                              backgroundColor: backgroundColor,
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Divider(
                          thickness: 1.5,
                          height: 1.5,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Q7,
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.pink,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Center(
                                      child: Wrap(
                                        alignment: WrapAlignment.center,
                                        spacing: 15,
                                        children: answer7.map((answers) {
                                          bool isSelected =
                                              selectAnswerQ7 == answers['label'];
                                          final forgroundColor = isSelected
                                              ? Colors.white
                                              : Colors.pink;
                                          final backgroundColor = isSelected
                                              ? primaryColor
                                              : secondaryColor;
                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selectAnswerQ7 = answers['label'];
                                                selectAnswerValueQ7 =
                                                    answers['value'];
                                                isSelect = false;
                                              });
                                              print(selectAnswerValueQ7);
                                              print(selectAnswerQ7);
                                            },
                                            child: Chip(
                                              shape: const StadiumBorder(
                                                  side: BorderSide(
                                                      color: Colors.pink)),
                                              label: Text(
                                                answers['label'],
                                                style: TextStyle(
                                                  color: forgroundColor,
                                                ),
                                              ),
                                              backgroundColor: backgroundColor,
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Divider(
                          thickness: 1.5,
                          height: 1.5,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                Q8,
                                style: const TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.pink,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Center(
                                      child: Wrap(
                                        alignment: WrapAlignment.center,
                                        spacing: 15,
                                        children: answer8.map((answers) {
                                          bool isSelected =
                                              selectAnswerQ8 == answers['label'];
                                          final forgroundColor = isSelected
                                              ? Colors.white
                                              : Colors.pink;
                                          final backgroundColor = isSelected
                                              ? primaryColor
                                              : secondaryColor;
                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selectAnswerQ8 = answers['label'];
                                                selectAnswerValueQ8 =
                                                    answers['value'];
                                                isSelect = false;
                                              });
                                              print(selectAnswerValueQ8);
                                              print(selectAnswerQ8);
                                            },
                                            child: Chip(
                                              shape: const StadiumBorder(
                                                  side: BorderSide(
                                                      color: Colors.pink)),
                                              label: Text(
                                                answers['label'],
                                                style: TextStyle(
                                                  color: forgroundColor,
                                                ),
                                              ),
                                              backgroundColor: backgroundColor,
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    SizedBox(
                                      width: 90,
                                      child: DropdownButtonFormField2(
                                        decoration: InputDecoration(
                                          isDense: true,
                                          filled: true,
                                          fillColor: isSelect
                                              ? primaryColor
                                              : secondaryColor,
                                          contentPadding: EdgeInsets.zero,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide(
                                              color: Colors.pink,
                                            ),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide(
                                              color: Colors.pink,
                                            ),
                                          ),
                                        ),
                                        isExpanded: true,
                                        hint: Text(
                                          'اخري',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: isSelect
                                                ? Colors.white
                                                : Colors.pink,
                                          ),
                                        ),
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: isSelect
                                                ? Colors.white
                                                : Colors.pink),
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          color: isSelect
                                              ? Colors.white
                                              : Colors.pink,
                                        ),
                                        buttonHeight: 35,
                                        dropdownWidth: 100,
                                        buttonPadding: const EdgeInsets.only(
                                            left: 8, right: 10),
                                        dropdownDecoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            color: primaryColor),
                                        items: items
                                            .map((item) => DropdownMenuItem<int>(
                                                  value: item['value'],
                                                  child: Text(
                                                    item['label'],
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                        onTap: () {
                                          setState(() {
                                            isSelect = true;
                                          });
                                        },
                                        onChanged: (value) {
                                          selectAnswerValueQ8 = value as int?;
                                          print("${selectAnswerValueQ8}");
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Divider(
                          thickness: 1.5,
                          height: 1.5,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        (state is! LoadingRiskDataState)
                            ? SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: defaultButton(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  text: 'نســبة الإصـابة',
                                  onPressed: () {
                                    onPressed();
                                  },
                                  radius: 30.0,
                                ),
                              )
                            : const Center(child: CircularProgressIndicator()),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        );
      },
    );
  }
}
