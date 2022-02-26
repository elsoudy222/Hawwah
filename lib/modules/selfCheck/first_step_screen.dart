import 'package:flutter/material.dart';
import 'package:hawwah/shared/components/colors.dart';

class SelfCheckScreen1 extends StatelessWidget {
  const SelfCheckScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height:MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(20.0)
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(

                children: [
                  Container(
                    height:115,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "هل يوجد اختلاف شكلى فى حجم الثديين؟"
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.pink,width: 1.0),
                                borderRadius: BorderRadius.circular(15.0)
                              ),
                              child: TextButton(
                                  onPressed: (){},
                                  child: Text("نعم")
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.pink,width: 1.0),
                                  borderRadius: BorderRadius.circular(15.0)
                              ),
                              child: TextButton(
                                  onPressed: (){},
                                  child: Text("نعم")
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.pink,
                              maxRadius: 40.0,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                 Divider(
                   color: Colors.pink,
                   thickness: 0.4,
                   indent: 15.0,
                   endIndent: 15.0,
                 ),
                  Container(
                    height:115,
                    width: double.infinity,

                    decoration: BoxDecoration(
                        color: secondaryColor,

                        borderRadius: BorderRadius.circular(20.0)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                            "هل يوجد اختلاف شكلى فى حجم الثديين؟"
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.pink,width: 2.0),
                                  borderRadius: BorderRadius.circular(15.0)
                              ),
                              child: TextButton(
                                  onPressed: (){},
                                  child: Text("نعم")
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.pink,width: 2.0),
                                  borderRadius: BorderRadius.circular(15.0)
                              ),
                              child: TextButton(
                                  onPressed: (){},
                                  child: Text("نعم")
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.pink,
                              maxRadius: 40.0,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.pink,
                    thickness: 0.4,
                    indent: 15.0,
                    endIndent: 15.0,
                  ),
                  Container(
                    height:115,
                    width: double.infinity,

                    decoration: BoxDecoration(
                        color: secondaryColor,

                        borderRadius: BorderRadius.circular(20.0)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                            "هل يوجد اختلاف شكلى فى حجم الثديين؟"
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.pink,width: 2.0),
                                  borderRadius: BorderRadius.circular(15.0)
                              ),
                              child: TextButton(
                                  onPressed: (){},
                                  child: Text("نعم")
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.pink,width: 2.0),
                                  borderRadius: BorderRadius.circular(15.0)
                              ),
                              child: TextButton(
                                  onPressed: (){},
                                  child: Text("نعم")
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.pink,
                              maxRadius: 40.0,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.pink,
                    thickness: 0.4,
                    indent: 15.0,
                    endIndent: 15.0,
                  ),
                  Container(
                    height:115,
                    width: double.infinity,

                    decoration: BoxDecoration(
                        color: secondaryColor,

                        borderRadius: BorderRadius.circular(20.0)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                            "هل يوجد اختلاف شكلى فى حجم الثديين؟"
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.pink,width: 2.0),
                                  borderRadius: BorderRadius.circular(15.0)
                              ),
                              child: TextButton(
                                  onPressed: (){},
                                  child: Text("نعم")
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.pink,width: 2.0),
                                  borderRadius: BorderRadius.circular(15.0)
                              ),
                              child: TextButton(
                                  onPressed: (){},
                                  child: Text("نعم")
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.pink,
                              maxRadius: 40.0,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.pink,
                    thickness: 0.4,
                    indent: 15.0,
                    endIndent: 15.0,
                  ),
                  Container(
                    height:115,
                    width: double.infinity,

                    decoration: BoxDecoration(
                        color: secondaryColor,

                        borderRadius: BorderRadius.circular(20.0)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                            "هل يوجد اختلاف شكلى فى حجم الثديين؟"
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.pink,width: 2.0),
                                  borderRadius: BorderRadius.circular(15.0)
                              ),
                              child: TextButton(
                                  onPressed: (){},
                                  child: Text("نعم")
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.pink,width: 2.0),
                                  borderRadius: BorderRadius.circular(15.0)
                              ),
                              child: TextButton(
                                  onPressed: (){},
                                  child: Text("نعم")
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.pink,
                              maxRadius: 40.0,
                            )
                          ],
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
