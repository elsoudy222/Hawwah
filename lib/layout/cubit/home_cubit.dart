
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hawwah/modules/calender/calender_screen.dart';
import 'package:hawwah/modules/home/home_screen.dart';
import 'package:hawwah/modules/prediction/prediction_screen.dart';
import 'package:hawwah/modules/riskCalculator/risk_calculator_screen.dart';


import '../../modules/selfCheck/self_check_screen.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);



  int currentIndex = 2;
  List<Widget> activeIcons = [
    Image(
      image: AssetImage("assets/images/logo.png"),
      height: 30.0,
      color: Colors.pink,
    ),
    Image(
      image: AssetImage("assets/images/logo.png"),
      height: 30.0,
      color: Colors.pink,
    ),
    Image(
      image: AssetImage("assets/images/logo.png"),
      height: 30.0,
      color: Colors.pink,
    ),
    Image(
      image: AssetImage("assets/images/logo.png"),
      height: 30.0,
      color: Colors.pink,
    ),
    Image(
      image: AssetImage("assets/images/logo.png"),
      height: 30.0,
      color: Colors.pink,
    ),


  ];
  List<Widget> inactiveIcons = [
    Text("risk"),
    Text("risk"),
    Text("risk"),
    Text("risk"),
    Text("risk"),

  ];


  List<BottomNavigationBarItem> bottomNavItems = const[

    BottomNavigationBarItem(
      icon: CircleAvatar(
        radius: 15,
        backgroundImage: AssetImage("assets/images/logo.png"),
        backgroundColor: Colors.transparent,
      ),
      label: "Prediction",
    ),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.calendarCheck),
      label: "Calender",
    ),
    BottomNavigationBarItem(
      icon: Image(
        image: AssetImage("assets/images/logo.png"),
        height: 30.0,
      ),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.userNurse),
      label: "Risk",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.bug_report_outlined),
      label: "SelfCheck",
    ),
  ];

  List<Widget> screens = [
     PredictionScreen(),
     CalenderScreen(),
    HomeScreen(),
    RiskCalculatorScreen(),
    SelfCheckScreen(),
  ];

  List<String> appbar = [
    "Prediction",
    "Calender",
    "Home",
    "Risk",
    "SelfCheck",

  ];

  void changeBottomNavBar(int index){
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }

}
