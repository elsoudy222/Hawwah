import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hawwah/modules/home/models.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  var pageController = PageController();
  List<Model> experments = [
    //zainab
    Model(
      image: "assets/images/logo.png",
      title: "كلكيعة وسن صغير",
      description:
          "٢٣سنة وعندي سرطان ثدي، ويمكن الدعم والعيلة وقوتي هما اللي ساعدوني اتخطى التجربة دي كل يوم بواجه أسئلة كتيرة زي إيه ده عندك سرطان ثدي ؟ هتتجوزي إزاي ؟",
      info:
          "كلكيعة وسن صغير\n ٢٣سنةوعندي سرطان ثدي، ويمكن الدعم والعيلة وقوتي هما اللي ساعدوني اتخطى التجربة دي كل يوم بواجه أسئلة كتيرة زي إيه ده عندك سرطان ثدي ؟ هتتجوزي إزاي ؟ جالك المرض ده إزاي ؟ وأسئلة غيرهم،،  والإجابة هي  "
          "ربنا بيختبرني من سنتين كنت في منحة لدراسة الهندسة في الصين، وظهرتلي كلكيعة وفي أول أجازة كلمت بهية وعملت التحاليل كلها والنتيجة ظهرت إن عندي سرطان ثدي كل اللي شغلني في مرحلة التعب والعلاج حلمي في الدراسة وإني مش هكون مع صحابي سنتين مروا وأنا أهو مخلصة علاجي، رجعت لدراستي ودلوقتي بعمل مشروع التخرج،، التجربة في سن صغير خلتني أتعلم .. ويكون في قلبي ثقة كبيرة إني هخف وإن تجربة السرطان هتكون محطة من محطات كتير بعدي بيها وبنجح علشان السرطان مرض لكن مش بيلغي الأحلام..السرطان بيخلينا نعرف نحلم أكتر",
    ),
    //Bassma
    Model(
      image: "assets/images/logo.png",
      title: "باسمة يوسف(36 عاما)",
      description:
          "كتشفت باسمة إصابتها بسرطان الثدي في الرابع عشر من أبريل هذا العامفي إحدى المرّات، لاحظت باسمة تورمّا في منطقة الثدي ونخزا وتغيّرا في لون الجلد، وعندما هرعت إلى المستشفيات كانت نتيجة الفحص",
      info:
          "بسمة يوسف (36 عاما) \n اكتشفت إصابتها بسرطان الثدي في الرابع عشر من أبريل هذا العامفي إحدى المرّات، لاحظت باسمة تورمّا في منطقة الثدي ونخزا وتغيّرا في لون الجلد، وعندما هرعت إلى المستشفيات كانت نتيجة الفحص أنها مصابة بسرطان في الثدي.  وقع الصدمة كان كبيراالأثر الأكبر الذي غيّر مسار حياة باسمة هو أنها لن تتمكن من الإنجاب على الإطلاق كما أخبرها الأطباءاكتشفت أنني مصابة بالسرطان وبعدها بثلاثة أسابيع تعيّن استئصال الثدي. كان لديّ ثلاثة أسابيع لأستعدّ نفسيا لحقيقة أنني سأفقد جزءا من جسدي واستبداله بجزء مصنوع من السيليكون لتعويض الجزء المفقود من أعضائي الحقيقية. ولذا للأسف لم أكن على استعداد، كنت أعدّ نفسي نفسيا لشيء كبير سيحدث ومررت به وكنت أتعلم كل يوم عن الخطوات التي يجب أن أتخذها لأتعافى.ربنا بيختبرني من سنتين كنت في منحة لدراسة الهندسة في الصين، وظهرتلي كلكيعة وفي أول أجازة كلمت بهية وعملت التحاليل كلها والنتيجة ظهرت إن عندي سرطان ثدي كل اللي شغلني في مرحلة التعب والعلاج حلمي في الدراسة وإني مش هكون مع صحابي سنتين مروا وأنا أهو مخلصة علاجي، رجعت لدراستي ودلوقتي بعمل مشروع التخرج،، التجربة في سن صغير خلتني أتعلم .. ويكون في قلبي ثقة كبيرة إني هخف وإن تجربة السرطان هتكون محطة من محطات كتير بعدي بيها وبنجح علشان السرطان مرض لكن مش بيلغي الأحلام..السرطان بيخلينا نعرف نحلم أكتر",
    ),
    //Maria
    Model(
      image: "assets/images/logo.png",
      title: "كلكيعة وسن صغير",
      description:
          "٢٣سنة وعندي سرطان ثدي، ويمكن الدعم والعيلة وقوتي هما اللي ساعدوني اتخطى التجربة دي كل يوم بواجه أسئلة كتيرة زي إيه ده عندك سرطان ثدي ؟ هتتجوزي إزاي ؟",
      info:
          "كلكيعة وسن صغير\n ٢٣سنةوعندي سرطان ثدي، ويمكن الدعم والعيلة وقوتي هما اللي ساعدوني اتخطى التجربة دي كل يوم بواجه أسئلة كتيرة زي إيه ده عندك سرطان ثدي ؟ هتتجوزي إزاي ؟ جالك المرض ده إزاي ؟ وأسئلة غيرهم،،  والإجابة هي  "
          "ربنا بيختبرني من سنتين كنت في منحة لدراسة الهندسة في الصين، وظهرتلي كلكيعة وفي أول أجازة كلمت بهية وعملت التحاليل كلها والنتيجة ظهرت إن عندي سرطان ثدي كل اللي شغلني في مرحلة التعب والعلاج حلمي في الدراسة وإني مش هكون مع صحابي سنتين مروا وأنا أهو مخلصة علاجي، رجعت لدراستي ودلوقتي بعمل مشروع التخرج،، التجربة في سن صغير خلتني أتعلم .. ويكون في قلبي ثقة كبيرة إني هخف وإن تجربة السرطان هتكون محطة من محطات كتير بعدي بيها وبنجح علشان السرطان مرض لكن مش بيلغي الأحلام..السرطان بيخلينا نعرف نحلم أكتر",
    ),
    //Elisa
    Model(
      image: "assets/images/logo.png",
      title: "كلكيعة وسن صغير",
      description:
          "٢٣سنة وعندي سرطان ثدي، ويمكن الدعم والعيلة وقوتي هما اللي ساعدوني اتخطى التجربة دي كل يوم بواجه أسئلة كتيرة زي إيه ده عندك سرطان ثدي ؟ هتتجوزي إزاي ؟",
      info:
          "كلكيعة وسن صغير\n ٢٣سنةوعندي سرطان ثدي، ويمكن الدعم والعيلة وقوتي هما اللي ساعدوني اتخطى التجربة دي كل يوم بواجه أسئلة كتيرة زي إيه ده عندك سرطان ثدي ؟ هتتجوزي إزاي ؟ جالك المرض ده إزاي ؟ وأسئلة غيرهم،،  والإجابة هي  "
          "ربنا بيختبرني من سنتين كنت في منحة لدراسة الهندسة في الصين، وظهرتلي كلكيعة وفي أول أجازة كلمت بهية وعملت التحاليل كلها والنتيجة ظهرت إن عندي سرطان ثدي كل اللي شغلني في مرحلة التعب والعلاج حلمي في الدراسة وإني مش هكون مع صحابي سنتين مروا وأنا أهو مخلصة علاجي، رجعت لدراستي ودلوقتي بعمل مشروع التخرج،، التجربة في سن صغير خلتني أتعلم .. ويكون في قلبي ثقة كبيرة إني هخف وإن تجربة السرطان هتكون محطة من محطات كتير بعدي بيها وبنجح علشان السرطان مرض لكن مش بيلغي الأحلام..السرطان بيخلينا نعرف نحلم أكتر",
    ),
    //Semona
    Model(
      image: "assets/images/logo.png",
      title: "كلكيعة وسن صغير",
      description:
          "٢٣سنة وعندي سرطان ثدي، ويمكن الدعم والعيلة وقوتي هما اللي ساعدوني اتخطى التجربة دي كل يوم بواجه أسئلة كتيرة زي إيه ده عندك سرطان ثدي ؟ هتتجوزي إزاي ؟",
      info:
          "كلكيعة وسن صغير\n ٢٣سنةوعندي سرطان ثدي، ويمكن الدعم والعيلة وقوتي هما اللي ساعدوني اتخطى التجربة دي كل يوم بواجه أسئلة كتيرة زي إيه ده عندك سرطان ثدي ؟ هتتجوزي إزاي ؟ جالك المرض ده إزاي ؟ وأسئلة غيرهم،،  والإجابة هي  "
          "ربنا بيختبرني من سنتين كنت في منحة لدراسة الهندسة في الصين، وظهرتلي كلكيعة وفي أول أجازة كلمت بهية وعملت التحاليل كلها والنتيجة ظهرت إن عندي سرطان ثدي كل اللي شغلني في مرحلة التعب والعلاج حلمي في الدراسة وإني مش هكون مع صحابي سنتين مروا وأنا أهو مخلصة علاجي، رجعت لدراستي ودلوقتي بعمل مشروع التخرج،، التجربة في سن صغير خلتني أتعلم .. ويكون في قلبي ثقة كبيرة إني هخف وإن تجربة السرطان هتكون محطة من محطات كتير بعدي بيها وبنجح علشان السرطان مرض لكن مش بيلغي الأحلام..السرطان بيخلينا نعرف نحلم أكتر",
    ),
  ];

  List<Model> information = [
    Model(
      image: "assets/images/google.png",
      title: "ما هو سرطان الثدي؟",
      description: "سرطان الثدي عبارة عن سرطان يتشكل في خلايا الثدي",
      info:
          "ما هي أسباب سرطان الثدي؟\n ويعرِّف الأطباء أن سرطان الثدي يحدث عندماتبدأ بعض خلايا الثدي في النموبطريقة غير طبيعية. تنقسم هذه الخلايا بسرعةأكبر من الخلايا السليمة وتستمر لتتراكم، وتشكِّلكتلة أو ورمًا. وقد تنتشر الخلايا (تنتقل) من خلالالثدي إلى العُقَد اللمفية، أو إلى أجزاء أخرىمن جسمك.يبدأ سرطان الثدي عادةً مع الخلايا الموجودةفي القنوات المنتجة للحليب (السرطان اللبني العنيف).يمكن أن يبدأ سرطان الثدي أيضًا في الأنسجةالغُدِّيَّة التي يُطلق عليها اسمالفصيصات (السرطان الفصيصي الغزوي)،أو في خلايا أو أنسجة أخرى داخل الثدي.",
    ),
    Model(
      image: "assets/images/google.png",
      title: "ما هو سرطان الثدي؟",
      description: "سرطان الثدي عبارة عن سرطان يتشكل في خلايا الثديي",
      info:
          "ما هي أسباب سرطان الثدي؟\n ويعرِّف الأطباء أن سرطان الثدي يحدث عندماتبدأ بعض خلايا الثدي في النموبطريقة غير طبيعية. تنقسم هذه الخلايا بسرعةأكبر من الخلايا السليمة وتستمر لتتراكم، وتشكِّلكتلة أو ورمًا. وقد تنتشر الخلايا (تنتقل) من خلالالثدي إلى العُقَد اللمفية، أو إلى أجزاء أخرىمن جسمك.يبدأ سرطان الثدي عادةً مع الخلايا الموجودةفي القنوات المنتجة للحليب (السرطان اللبني العنيف).يمكن أن يبدأ سرطان الثدي أيضًا في الأنسجةالغُدِّيَّة التي يُطلق عليها اسمالفصيصات (السرطان الفصيصي الغزوي)،أو في خلايا أو أنسجة أخرى داخل الثدي.",
    ),
    Model(
      image: "assets/images/google.png",
      title: "ما هو سرطان الثدي؟",
      description: "سرطان الثدي عبارة عن سرطان يتشكل في خلايا الثديي",
      info:
          "ما هي أسباب سرطان الثدي؟\n ويعرِّف الأطباء أن سرطان الثدي يحدث عندماتبدأ بعض خلايا الثدي في النموبطريقة غير طبيعية. تنقسم هذه الخلايا بسرعةأكبر من الخلايا السليمة وتستمر لتتراكم، وتشكِّلكتلة أو ورمًا. وقد تنتشر الخلايا (تنتقل) من خلالالثدي إلى العُقَد اللمفية، أو إلى أجزاء أخرىمن جسمك.يبدأ سرطان الثدي عادةً مع الخلايا الموجودةفي القنوات المنتجة للحليب (السرطان اللبني العنيف).يمكن أن يبدأ سرطان الثدي أيضًا في الأنسجةالغُدِّيَّة التي يُطلق عليها اسمالفصيصات (السرطان الفصيصي الغزوي)،أو في خلايا أو أنسجة أخرى داخل الثدي.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "التجــارب .",
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.pink,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                height: 230.0,
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      Experments(context, experments[index]),
                  itemCount: experments.length,
                  controller: pageController,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "معلومـات.",
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.pink,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                height: 150.0,
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      Informations(context, information[index]),
                  itemCount: information.length,
                  controller: pageController,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 550.0,
                child: Stack(
                  children: [
                    Positioned(
                      top: 100.0,
                      height: 400.0,
                      width: 350,
                      child: Container(
                        decoration: BoxDecoration(
                          color: secondaryColor,
                            borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: Colors.pink),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "- قللى من تناول الكحوليات",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.pink,
                                ),
                              ),
                              Text(
                                "-الاستمرار فى ممارسة الرياضه",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.pink,
                                ),
                              ),
                              Text(
                                "- الرضاعة الطبيعية",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.pink,
                                ),
                              ),
                              Text(
                                "- تناول الأغذيه الصحيه",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.pink,
                                ),
                              ),
                              Text(
                                "- الحد من العلاج الهرمونى بعد انقطاع الحيض",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.pink,
                                ),
                              ),
                              Text(
                                "- وللمدخنات: يجب الابتعاد عن التدخين",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.pink,
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0.0,
                      right: 0.0,
                      height: 150.0,
                      width: 150,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/logo.png",
                                )
                            )
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
    );
  }
}

Widget Experments(context, Model experments) => Container(
      height: 230.0,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${experments.title}",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${experments.description}",
                    style: TextStyle(fontSize: 15.0, color: Colors.pink),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                  GestureDetector(
                    child: Container(
                      width: 100.0,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: const Center(
                          child: Text(
                        "قراءة المزيد...",
                        style: TextStyle(fontSize: 15.0, color: Colors.white),
                      )),
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        // shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.vertical(
                        //         top: Radius.circular(25.0))),
                        isDismissible: false,
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        elevation: 0.0,
                        context: context,
                        builder: (context) => DraggableScrollableSheet(
                          initialChildSize: 0.8,
                          maxChildSize: 0.8,
                          minChildSize: 0.4,
                          builder: (_, controller) => Container(
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(20.0),
                            ),

                            padding: EdgeInsets.all(16.0),
                            child: ListView(
                              controller: controller,
                              children: [
                                Text(
                                  "${experments.info}",
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.pink),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          // Image :
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Image.asset(
              "${experments.image}",
              height: 200.0,
              width: 150.0,
            ),
          ),
        ],
      ),
    );

Widget Informations(context, Model information) => Container(
      height: 150.0,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${information.title}",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${information.description}",
                    style: TextStyle(fontSize: 15.0, color: Colors.pink),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                  GestureDetector(
                    child: Container(
                      width: 100.0,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: const Center(
                          child: Text(
                        "قراءة المزيد...",
                        style: TextStyle(fontSize: 15.0, color: Colors.white),
                      )),
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(25.0))),
                        isDismissible: false,
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        elevation: 0.0,
                        context: context,
                        builder: (context) => DraggableScrollableSheet(
                          initialChildSize: 0.8,
                          maxChildSize: 0.8,
                          minChildSize: 0.4,
                          builder: (_, controller) => Container(
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            padding: EdgeInsets.all(16.0),
                            child: ListView(
                              controller: controller,
                              children: [
                                Text(
                                  "${information.info}",
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.pink),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          // Image :
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Image.asset(
              "${information.image}",
              height: 125.0,
              width: 125.0,
            ),
          ),
        ],
      ),
    );



