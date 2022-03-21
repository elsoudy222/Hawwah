
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    const Image(
      image: AssetImage("assets/icons/searching.png"),
      height: 30.0,
      color: Colors.pink,
    ),
    const Image(
      image: AssetImage("assets/icons/calendar.png"),
      height: 30.0,
      color: Colors.pink,
    ),
    const Image(
      image: AssetImage("assets/icons/home.png"),
      height: 30.0,
      color: Colors.pink,
    ),
    const Image(
      image: AssetImage("assets/icons/checklist.png"),
      height: 30.0,
      color: Colors.pink,
    ),
    const Image(
      image: AssetImage("assets/icons/breast.png"),
      height: 30.0,
      color: Colors.pink,
    ),


  ];



  List<BottomNavigationBarItem> bottomNavItems = const[

    BottomNavigationBarItem(
      icon: Image(
        image: AssetImage("assets/icons/searching.png"),
        height: 30.0,
      ),
      label: "Prediction",
    ),
    BottomNavigationBarItem(
      icon: Image(
        image: AssetImage("assets/icons/calendar.png"),
        height: 30.0,
      ),
      label: "Calender",
    ),
    BottomNavigationBarItem(
      icon: Image(
        image: AssetImage("assets/icons/home.png"),
        height: 30.0,
      ),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Image(
        image: AssetImage("assets/icons/checklist.png"),
        height: 30.0,
      ),
      label: "Risk",
    ),
    BottomNavigationBarItem(
      icon: Image(
        image: AssetImage("assets/icons/breast.png"),
        height: 30.0,
      ),
      label: "SelfCheck",
    ),
  ];

  List<Widget> screens = [
     const PredictionScreen(),
     const CalenderScreen(),
    const HomeScreen(),
    const RiskCalculatorScreen(),
    const IntroSelfCheckScreen1(),
  ];


  void changeBottomNavBar(int index){
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }

}
