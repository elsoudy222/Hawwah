
import 'package:flutter/material.dart';
import 'package:hawwah/modules/home/models.dart';
import 'package:hawwah/shared/components/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pageController = PageController();

  List<Model> experments = [
    //zainab
    Model(
      image: "assets/images/home/zainab.png",
      title: "كلكيعة وسن صغير",
      description:
          "٢٣سنة وعندي سرطان ثدي، ويمكن الدعم والعيلة وقوتي هما اللي ساعدوني اتخطى التجربة دي كل يوم بواجه أسئلة كتيرة زي إيه ده عندك سرطان ثدي ؟ هتتجوزي إزاي ؟",
      info:
          "كلكيعة وسن صغير\n ٢٣سنةوعندي سرطان ثدي، ويمكن الدعم والعيلة وقوتي هما اللي ساعدوني اتخطى التجربة دي كل يوم بواجه أسئلة كتيرة زي إيه ده عندك سرطان ثدي ؟ هتتجوزي إزاي ؟ جالك المرض ده إزاي ؟ وأسئلة غيرهم،،  والإجابة هي  "
          "ربنا بيختبرني من سنتين كنت في منحة لدراسة الهندسة في الصين، وظهرتلي كلكيعة وفي أول أجازة كلمت بهية وعملت التحاليل كلها والنتيجة ظهرت إن عندي سرطان ثدي كل اللي شغلني في مرحلة التعب والعلاج حلمي في الدراسة وإني مش هكون مع صحابي سنتين مروا وأنا أهو مخلصة علاجي، رجعت لدراستي ودلوقتي بعمل مشروع التخرج،، التجربة في سن صغير خلتني أتعلم .. ويكون في قلبي ثقة كبيرة إني هخف وإن تجربة السرطان هتكون محطة من محطات كتير بعدي بيها وبنجح علشان السرطان مرض لكن مش بيلغي الأحلام..السرطان بيخلينا نعرف نحلم أكتر",
    ),
    //Bassma
    Model(
      image: "assets/images/home/bassma.png",
      title: "باسمة يوسف(36 عاما)",
      description:
          "كتشفت باسمة إصابتها بسرطان الثدي في الرابع عشر من أبريل هذا العامفي إحدى المرّات، لاحظت باسمة تورمّا في منطقة الثدي ونخزا وتغيّرا في لون الجلد، وعندما هرعت إلى المستشفيات كانت نتيجة الفحص",
      info:
          "بسمة يوسف (36 عاما) \n اكتشفت إصابتها بسرطان الثدي في الرابع عشر من أبريل هذا العامفي إحدى المرّات، لاحظت باسمة تورمّا في منطقة الثدي ونخزا وتغيّرا في لون الجلد، وعندما هرعت إلى المستشفيات كانت نتيجة الفحص أنها مصابة بسرطان في الثدي.  وقع الصدمة كان كبيراالأثر الأكبر الذي غيّر مسار حياة باسمة هو أنها لن تتمكن من الإنجاب على الإطلاق كما أخبرها الأطباءاكتشفت أنني مصابة بالسرطان وبعدها بثلاثة أسابيع تعيّن استئصال الثدي. كان لديّ ثلاثة أسابيع لأستعدّ نفسيا لحقيقة أنني سأفقد جزءا من جسدي واستبداله بجزء مصنوع من السيليكون لتعويض الجزء المفقود من أعضائي الحقيقية. ولذا للأسف لم أكن على استعداد، كنت أعدّ نفسي نفسيا لشيء كبير سيحدث ومررت به وكنت أتعلم كل يوم عن الخطوات التي يجب أن أتخذها لأتعافى.ربنا بيختبرني من سنتين كنت في منحة لدراسة الهندسة في الصين، وظهرتلي كلكيعة وفي أول أجازة كلمت بهية وعملت التحاليل كلها والنتيجة ظهرت إن عندي سرطان ثدي كل اللي شغلني في مرحلة التعب والعلاج حلمي في الدراسة وإني مش هكون مع صحابي سنتين مروا وأنا أهو مخلصة علاجي، رجعت لدراستي ودلوقتي بعمل مشروع التخرج،، التجربة في سن صغير خلتني أتعلم .. ويكون في قلبي ثقة كبيرة إني هخف وإن تجربة السرطان هتكون محطة من محطات كتير بعدي بيها وبنجح علشان السرطان مرض لكن مش بيلغي الأحلام..السرطان بيخلينا نعرف نحلم أكتر",
    ),
    //Maria
    Model(
      image: "assets/images/home/maria.png",
      title: "كلكيعة وسن صغير",
      description:
          "٢٣سنة وعندي سرطان ثدي، ويمكن الدعم والعيلة وقوتي هما اللي ساعدوني اتخطى التجربة دي كل يوم بواجه أسئلة كتيرة زي إيه ده عندك سرطان ثدي ؟ هتتجوزي إزاي ؟",
      info:
          "كلكيعة وسن صغير\n ٢٣سنةوعندي سرطان ثدي، ويمكن الدعم والعيلة وقوتي هما اللي ساعدوني اتخطى التجربة دي كل يوم بواجه أسئلة كتيرة زي إيه ده عندك سرطان ثدي ؟ هتتجوزي إزاي ؟ جالك المرض ده إزاي ؟ وأسئلة غيرهم،،  والإجابة هي  "
          "ربنا بيختبرني من سنتين كنت في منحة لدراسة الهندسة في الصين، وظهرتلي كلكيعة وفي أول أجازة كلمت بهية وعملت التحاليل كلها والنتيجة ظهرت إن عندي سرطان ثدي كل اللي شغلني في مرحلة التعب والعلاج حلمي في الدراسة وإني مش هكون مع صحابي سنتين مروا وأنا أهو مخلصة علاجي، رجعت لدراستي ودلوقتي بعمل مشروع التخرج،، التجربة في سن صغير خلتني أتعلم .. ويكون في قلبي ثقة كبيرة إني هخف وإن تجربة السرطان هتكون محطة من محطات كتير بعدي بيها وبنجح علشان السرطان مرض لكن مش بيلغي الأحلام..السرطان بيخلينا نعرف نحلم أكتر",
    ),
    //Elisa
    Model(
      image: "assets/images/home/elissa.jpg",
      title: "كلكيعة وسن صغير",
      description:
          "٢٣سنة وعندي سرطان ثدي، ويمكن الدعم والعيلة وقوتي هما اللي ساعدوني اتخطى التجربة دي كل يوم بواجه أسئلة كتيرة زي إيه ده عندك سرطان ثدي ؟ هتتجوزي إزاي ؟",
      info:
          "كلكيعة وسن صغير\n ٢٣سنةوعندي سرطان ثدي، ويمكن الدعم والعيلة وقوتي هما اللي ساعدوني اتخطى التجربة دي كل يوم بواجه أسئلة كتيرة زي إيه ده عندك سرطان ثدي ؟ هتتجوزي إزاي ؟ جالك المرض ده إزاي ؟ وأسئلة غيرهم،،  والإجابة هي  "
          "ربنا بيختبرني من سنتين كنت في منحة لدراسة الهندسة في الصين، وظهرتلي كلكيعة وفي أول أجازة كلمت بهية وعملت التحاليل كلها والنتيجة ظهرت إن عندي سرطان ثدي كل اللي شغلني في مرحلة التعب والعلاج حلمي في الدراسة وإني مش هكون مع صحابي سنتين مروا وأنا أهو مخلصة علاجي، رجعت لدراستي ودلوقتي بعمل مشروع التخرج،، التجربة في سن صغير خلتني أتعلم .. ويكون في قلبي ثقة كبيرة إني هخف وإن تجربة السرطان هتكون محطة من محطات كتير بعدي بيها وبنجح علشان السرطان مرض لكن مش بيلغي الأحلام..السرطان بيخلينا نعرف نحلم أكتر",
    ),
    //Semona
    Model(
      image: "assets/images/home/semona.png",
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
      image: "assets/images/home/info2.jpg",
      title: "ما هو سرطان الثدي؟",
      description: "سرطان الثدي عبارة عن سرطان يتشكل في خلايا الثدي",
      info:
          "ما هي أسباب سرطان الثدي؟\n ويعرِّف الأطباء أن سرطان الثدي يحدث عندماتبدأ بعض خلايا الثدي في النموبطريقة غير طبيعية. تنقسم هذه الخلايا بسرعةأكبر من الخلايا السليمة وتستمر لتتراكم، وتشكِّلكتلة أو ورمًا. وقد تنتشر الخلايا (تنتقل) من خلالالثدي إلى العُقَد اللمفية، أو إلى أجزاء أخرىمن جسمك.يبدأ سرطان الثدي عادةً مع الخلايا الموجودةفي القنوات المنتجة للحليب (السرطان اللبني العنيف).يمكن أن يبدأ سرطان الثدي أيضًا في الأنسجةالغُدِّيَّة التي يُطلق عليها اسمالفصيصات (السرطان الفصيصي الغزوي)،أو في خلايا أو أنسجة أخرى داخل الثدي.",
    ),
    Model(
      image: "assets/images/home/info1.png",
      title: "ما هو سرطان الثدي؟",
      description: "سرطان الثدي عبارة عن سرطان يتشكل في خلايا الثديي",
      info:
          "ما هي أسباب سرطان الثدي؟\n ويعرِّف الأطباء أن سرطان الثدي يحدث عندماتبدأ بعض خلايا الثدي في النموبطريقة غير طبيعية. تنقسم هذه الخلايا بسرعةأكبر من الخلايا السليمة وتستمر لتتراكم، وتشكِّلكتلة أو ورمًا. وقد تنتشر الخلايا (تنتقل) من خلالالثدي إلى العُقَد اللمفية، أو إلى أجزاء أخرىمن جسمك.يبدأ سرطان الثدي عادةً مع الخلايا الموجودةفي القنوات المنتجة للحليب (السرطان اللبني العنيف).يمكن أن يبدأ سرطان الثدي أيضًا في الأنسجةالغُدِّيَّة التي يُطلق عليها اسمالفصيصات (السرطان الفصيصي الغزوي)،أو في خلايا أو أنسجة أخرى داخل الثدي.",
    ),
    Model(
      image: "assets/images/home/info3.png",
      title: "ما هو سرطان الثدي؟",
      description: "سرطان الثدي عبارة عن سرطان يتشكل في خلايا الثديي",
      info:
          "ما هي أسباب سرطان الثدي؟\n ويعرِّف الأطباء أن سرطان الثدي يحدث عندماتبدأ بعض خلايا الثدي في النموبطريقة غير طبيعية. تنقسم هذه الخلايا بسرعةأكبر من الخلايا السليمة وتستمر لتتراكم، وتشكِّلكتلة أو ورمًا. وقد تنتشر الخلايا (تنتقل) من خلالالثدي إلى العُقَد اللمفية، أو إلى أجزاء أخرىمن جسمك.يبدأ سرطان الثدي عادةً مع الخلايا الموجودةفي القنوات المنتجة للحليب (السرطان اللبني العنيف).يمكن أن يبدأ سرطان الثدي أيضًا في الأنسجةالغُدِّيَّة التي يُطلق عليها اسمالفصيصات (السرطان الفصيصي الغزوي)،أو في خلايا أو أنسجة أخرى داخل الثدي.",
    ),
  ];

  var _expermentsIndex = 0;
  var _informationsIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
           // _background(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // EXPERMENT...
                  const Text(
                    "التجــارب .",
                    style:  TextStyle(
                        fontSize: 30.0,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 230.0,
                    //margin: EdgeInsets.all(10.0),
                    child: PageView.builder(
                      onPageChanged: (index){
                        setState(() {
                          _expermentsIndex = index;
                        });
                      },
                      controller: pageController,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          Container(
                              margin: const EdgeInsets.all(10.0),
                              child: Experments(context, experments[index])),
                      itemCount: experments.length,

                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(experments.length, (index) => Indicator(
                         isActive : _expermentsIndex == index ? true : false
                      ))

                    ],
                  ),

                  // INFORMATION...
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    "معلومـات.",
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 180.0,
                    child: PageView.builder(
                      onPageChanged: (index){
                        setState(() {
                          _informationsIndex = index;
                        });
                      },
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          Container(
                              margin: const EdgeInsets.all(10.0),
                              child: Informations(context, information[index])),
                      itemCount: information.length,
                      controller: pageController,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(information.length, (index) => Indicator(
                          isActive : _informationsIndex == index ? true : false
                      ))

                    ],
                  ),

                  //ADVICES...
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    height: 550.0,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 100.0,
                          height: 400.0,
                          width: 370,
                          child: Container(
                            decoration: BoxDecoration(
                              // image: DecorationImage(
                              //   image: Image.asset("assets/images/home/home_back.png"),
                              // ),
                              color: secondaryColor,
                                borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(color: Colors.pink),
                            ),

                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 50.0),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
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
                        ),
                        Positioned(
                          top: 0.0,
                          right: 0.0,
                          height: 200.0,
                          width: 200,
                          child: Container(
                            child: const Center(
                              child:  Text(
                                "نصائح",
                                style: TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.pink,
                                ),
                              ),
                            ),
                            decoration: const BoxDecoration(
                                image:  DecorationImage(
                                    image: AssetImage(
                                      "assets/images/cloud.png",
                                    )
                                ),

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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


//CUSTOM WIDGETS...
class Indicator extends StatelessWidget {
  final bool? isActive;
   const Indicator({
    Key? key,
   this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: Container(
        width: isActive!? 20.0 :8.0,
        height: 8.0,
        decoration: BoxDecoration(
          color:isActive!? Colors.pink : secondaryColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget Experments(context, Model experments) => Container(
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
                  // Title..
                  Text(
                    "${experments.title}",
                    style: const TextStyle(
                        fontSize: 20.0,
                        color: Color(0xFFE91E63),
                        fontWeight: FontWeight.bold),
                  ),
                  //Description
                  Text(
                    "${experments.description}",
                    style: const TextStyle(fontSize: 15.0, color: Colors.pink),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
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

                            padding: const EdgeInsets.all(16.0),
                            child: ListView(
                              controller: controller,
                              children: [
                                Text(
                                  "${experments.info}",
                                  style: const TextStyle(
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
            height: 230.0,
            width: 160.0,
            decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                    image: AssetImage(
                      "${experments.image}",
                    ),
                    fit: BoxFit.cover
                )
            ),

          ),

        ],
      ),
    );

Widget Informations(context, Model information) => Container(

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
                    style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.pink,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${information.description}",
                    style: const TextStyle(fontSize: 15.0, color: Colors.pink),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
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
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: const Radius.circular(25.0))),
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
                            padding: const EdgeInsets.all(16.0),
                            child: ListView(
                              controller: controller,
                              children: [
                                Text(
                                  "${information.info}",
                                  style: const TextStyle(
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
            height: 200.0,
            width: 145.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: AssetImage(
                  "${information.image}",
                ),
                fit: BoxFit.cover
              )
            ),
            // child: Image.asset(
            //   "${information.image}",
            //   fit: BoxFit.cover,
            //
            // ),
          ),
          //SizedBox(width: 5.0,)
        ],
      ),
    );



