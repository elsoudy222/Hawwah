
import 'package:flutter/material.dart';

import 'model.dart';
import "package:smooth_page_indicator/smooth_page_indicator.dart";

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<Model> pages = [
    Model(
      image: 'assets/images/boarding_1.png',
      title: 'Welcome',
      body: 'Hello in Shop App',
    ),
    Model(
      image: 'assets/images/boarding_2.png',
      title: 'Easy to Shopping',
      body:
      'The Shop App is real-time buying and browsing experience for customers',
    ),
    Model(
      image: 'assets/images/boarding_3.png',
      title: 'Online Shopping',
      body:
      'The Shop App is all about making it easier for people to purchase from your online store',
    ),
    Model(
        image: "assets/images/boarding_4.png",
        title: "Easy to Use",
        body: "The Shop App is real-time buying and browsing experience for customers"),
    Model(
        image: "assets/images/boarding_5.png",
        title: "Online Shopping",
        body: "The Shop App is all about making it easier for people to purchase from your online store"),
  ];

  var pageController = PageController();

  bool isLast = false;

  // void submit(){
  //
  //   CacheHelper.saveData(key: "onBoarding", value: true).then((value) {
  //     if(value){
  //       navigateToAndFinish(
  //         context,
  //         LoginScreen(),
  //       );
  //     }
  //   });
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: (){
               // submit();
              },
              child: Text(
                "SKIP",
                style: TextStyle(color: Colors.pink),))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  onPageChanged: (int index) {
                    if (index == pages.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      buildBoarderItem(pages[index]),
                  itemCount: pages.length,
                  controller: pageController,
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller: pageController,
                    count: pages.length,
                    effect: ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        dotHeight: 10,
                        expansionFactor:4,
                        dotWidth: 10,
                      activeDotColor: Colors.pink,
                    ),

                  ),
                  Spacer(),
                  FloatingActionButton(
                    backgroundColor: Colors.pink,
                    onPressed: () {
                      if(isLast) {
                       //submit();
                      } else {
                        pageController.nextPage(
                            duration: Duration(milliseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn);
                      }

                    },
                    child: Icon(
                      Icons.arrow_forward_ios_outlined,
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }

  Widget buildBoarderItem(Model pages) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Image(
            image: AssetImage(
              '${pages.image}',
            ),
          )),
          SizedBox(
            height: 30,
          ),
          Text(
            "${pages.title}",
            style: TextStyle(
              fontSize: 25,
           //   fontFamily: "MyFlutterApp",
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "${pages.body}",
            style: TextStyle(
              fontSize: 14,
             // fontFamily: "MyFlutterApp",
            ),
          )
        ],
      );
}
