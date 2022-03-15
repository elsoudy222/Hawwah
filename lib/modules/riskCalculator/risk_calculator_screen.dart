
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: double.infinity,
                   height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(5.0),
                           // color: Colors.red,
                            width: double.infinity,

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
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
                                  //height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                        border: Border.all(color: Colors.pink)
                                    ),
                                  child: defaultFormField(
                                      controller: ageController,
                                      keyboardType: TextInputType.number,
                                      prefix: Icons.accessibility
                                  )
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            thickness: 0.4,
                            height: 1.5,
                          ),
                          const SizedBox(height: 10.0,),
                          Container(
                            //color: Colors.red,
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                    "كم كان سن المرأة في أول حيض لها؟",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.pink,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  height: 50,
                                  child: ListView.separated(
                                    padding: const EdgeInsets.all(10.0),
                                    scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) => buildGestureDetector(text: "الاجابه"),
                                      separatorBuilder: (context,index)=> const SizedBox(width: 5.0,),
                                      itemCount: 4),
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            thickness: 0.4,
                            height: 1.5,
                          ),
                          const SizedBox(height: 10.0,),
                          Container(
                            //color: Colors.red,
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                    "كم كان عمر المرأة وقت ولادت الطفل الاول؟",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.pink,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  height: 50,
                                  child: ListView.separated(
                                      padding: const EdgeInsets.all(10.0),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) => buildGestureDetector(text: "الاجابه"),
                                      separatorBuilder: (context,index)=> const SizedBox(width: 10.0,),
                                      itemCount: 4),
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            thickness: 0.4,
                            height: 1.5,
                          ),
                          const SizedBox(height: 10.0,),
                          Container(
                            //color: Colors.red,
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                    "هل سبق للمرأة أن خضعت لأخذ عينة من الثدى؟ ",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.pink,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  height: 50,
                                  child: ListView.separated(
                                      padding: const EdgeInsets.all(10.0),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) => buildGestureDetector(text: "الاجابه"),
                                      separatorBuilder: (context,index)=> const SizedBox(width: 10.0,),
                                      itemCount: 4),
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            thickness: 0.4,
                            height: 1.5,
                          ),
                          const SizedBox(height: 10.0,),
                          Container(
                            //color: Colors.red,
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                    "كم عدد عينات الثدي (الإيجابية أو السلبية)التي خضعت لها المرأه؟",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.pink,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  height: 50,
                                  child: ListView.separated(
                                      padding: const EdgeInsets.all(10.0),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) => buildGestureDetector(text: "الاجابه"),
                                      separatorBuilder: (context,index)=> const SizedBox(width: 10.0,),
                                      itemCount: 4),
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            thickness: 0.4,
                            height: 1.5,
                          ),
                          const SizedBox(height: 10.0,),
                          Container(
                            //color: Colors.red,
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                    "هل خضعت المرأه لخزعة ثدى واحدة على الأقل مصحوبه بتضخم غير منطقى؟",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.pink,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  height: 50,
                                  child: ListView.separated(
                                      padding: const EdgeInsets.all(10.0),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) => buildGestureDetector(text: "الاجابه"),
                                      separatorBuilder: (context,index)=> const SizedBox(width: 10.0,),
                                      itemCount: 4),
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            thickness: 0.4,
                            height: 1.5,
                          ),
                          const SizedBox(height: 10.0,),
                          Container(
                            //color: Colors.red,
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                    "كم عدد اقارب المرأة من الدرجة الأولى(أم - اخوات - اطفال بنات)مصابات بسرطان الثدي؟",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.pink,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  height: 50,
                                  child: ListView.separated(
                                      padding: const EdgeInsets.all(10.0),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) => buildGestureDetector(text: "الاجابه"),
                                      separatorBuilder: (context,index)=> const SizedBox(width: 10.0,),
                                      itemCount: 4),
                                )
                              ],
                            ),
                          ),
                          const Divider(
                            thickness: 0.4,
                            height: 1.5,
                          ),
                          const SizedBox(height: 10.0,),
                          Container(
                            //color: Colors.red,
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                    "ما هو جنس / عرق المرأة؟",
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.pink,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Container(
                                  height: 50,
                                  child: ListView.separated(
                                      padding: const EdgeInsets.all(10.0),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) => buildGestureDetector(text: "الاجابه"),
                                      separatorBuilder: (context,index)=> const SizedBox(width: 10.0,),
                                      itemCount: 4),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 20.0,),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: defaultButton(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              text: 'نســبة الإصـابة',
                              onPressed: () {
                                // navigateToAndFinish(context, HomeLayout());
                              },
                              radius: 30.0,
                              // width: MediaQuery.of(context).size.width ,
                            ),
                          ),

                        ],
                      ),
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }
}


Widget buildGestureDetector({required String text}) {
  return GestureDetector(
    child: Container(
      width: 100.0,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Center(
          child: Text(
        text,
        style: const TextStyle(fontSize: 15.0, color: Colors.white),
      )),
    ),
    onTap: () {},
  );
}
