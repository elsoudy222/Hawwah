import 'package:bloc/bloc.dart';
import 'package:circle_bottom_navigation_bar/widgets/tab_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hawwah/modules/calender/calender_screen.dart';
import 'package:hawwah/modules/home/home_screen.dart';
import 'package:hawwah/modules/prediction/prediction_screen.dart';
import 'package:hawwah/modules/riskCalculator/risk_calculator_screen.dart';
import 'package:hawwah/modules/selfCheck/first_step_screen.dart';
import 'package:meta/meta.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);



  int currentIndex = 2;

  List<BottomNavigationBarItem> bottomNavItems = const[
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.searchLocation),
      label: "Prediction",
    ),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.calendarCheck),
      label: "Calender",
    ),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.home, size: 30,),
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
    SelfCheckScreen1(),
  ];

  void changeBottomNavBar(int index){
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }

}
