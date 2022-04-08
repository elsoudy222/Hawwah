import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hawwah/models/risk_model.dart';
import 'package:hawwah/modules/calender/calender_screen.dart';
import 'package:hawwah/modules/home/home_screen.dart';
import 'package:hawwah/modules/prediction/prediction_screen.dart';
import 'package:hawwah/modules/riskCalculator/risk_calculator_screen.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/network/remote/dio_helper.dart';

import '../../modules/selfCheck/self_check_screen.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 2;
  List<Widget> activeIcons = [
     Image(
      image: AssetImage("assets/icons/searching.png"),
      height: 30.0,
      color: thirdColor,
    ),
     Image(
      image: AssetImage("assets/icons/calendar.png"),
      height: 30.0,
      color: thirdColor,
    ),
     Image(
      image: AssetImage("assets/icons/home.png"),
      height: 30.0,
      color: thirdColor,
    ),
     Image(
      image: AssetImage("assets/icons/checklist.png"),
      height: 30.0,
      color: thirdColor,
    ),
     Image(
      image: AssetImage("assets/icons/breast.png"),
      height: 30.0,
      color: thirdColor,
    ),
  ];

  List<BottomNavigationBarItem> bottomNavItems =  [
    BottomNavigationBarItem(
      activeIcon: Image(
        image: AssetImage("assets/icons/searching.png"),
        height: 30.0,
        color: thirdColor,
      ),
      icon: Image(
        image: AssetImage("assets/icons/searching.png"),
        height: 30.0,
        color: Colors.black87,
      ),
      label: "",
    ),
    BottomNavigationBarItem(
      activeIcon: Image(
        image: AssetImage("assets/icons/calendar.png"),
        height: 30.0,
        color: thirdColor,
      ),
      icon: Image(
        image: AssetImage("assets/icons/calendar.png"),
        height: 30.0,
        color: Colors.black87,
      ),
      label: "",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.circle,
        color: Colors.transparent,
      ),
      label: "",
    ),
    BottomNavigationBarItem(
      activeIcon: Image(
        image: AssetImage("assets/icons/checklist.png"),
        height: 30.0,
        color: thirdColor,
      ),
      icon: Image(
        image: AssetImage("assets/icons/checklist.png"),
        height: 30.0,
        color: Colors.black87,
      ),
      label: "",
    ),
    BottomNavigationBarItem(
      activeIcon: Image(
        image: AssetImage("assets/icons/breast.png"),
        height: 30.0,
        color: thirdColor,
      ),
      icon: Image(
        image: AssetImage("assets/icons/breast.png"),
        height: 30.0,
        color: Colors.black87,
      ),
      label: "",
    ),
  ];

  List<Widget> screens = [
    const PredictionScreen(),
    const CalenderScreen(),
    const HomeScreen(),
    const RiskCalculatorScreen(),
    const IntroSelfCheckScreen1(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }

  var prediction;

  void sendPredictionData({
    required String texture_mean,
    required String area_mean,
    required String concavity_mean,
    required String texture_se,
    required String area_se,
    required String concavity_se,
    required String symmetry_se,
    required String smoothness_worst,
    required String concavity_worst,
    required String symmetry_worst,
    required String fractal_dimension_worst,
  }) {
    emit(LoadingPredictionDataState());
    DioHelper.postData(
      url: '/api/',
      data: {
        "texture mean": texture_mean,
        "area_mean": area_mean,
        "concavity_mean": concavity_mean,
        "texture_se": texture_se,
        "area_se": area_se,
        "concavity_se": concavity_se,
        "symmetry_se": symmetry_se,
        "smoothness_worst": smoothness_worst,
        "concavity_worst": concavity_worst,
        "symmetry_worst": symmetry_worst,
        "fractal_dimension_worst": fractal_dimension_worst,
      },
    ).then((value) {
      prediction = value.data;
      emit(SuccessPredictionDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorPredictionDataState());
    });
  }

  RiskModel? riskModel;

  void sendRiskData({
    required int age,
    required int menarch_age,
    required int live_birth_age,
    required int ever_had_biopsy,
    required int num_biopsy,
    required int first_deg_relatives,
    required int ihyp,
    required int race,
  }) {
    emit(LoadingRiskDataState());
    DioHelper.postData(
      url: '/api/v1.0/gail',
      data: {
        "age": age,
        "menarch_age": menarch_age,
        "live_birth_age": live_birth_age,
        "ever_had_biopsy": ever_had_biopsy,
        "num_biopsy": num_biopsy,
        "first_deg_relatives": first_deg_relatives,
        "ihyp": ihyp,
        "race": race
      },
    ).then((value) {
      riskModel = RiskModel.fromJson(value.data);
      print(value);
      emit(SuccessRiskDataState(riskModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ErrorRiskDataState());
    });
  }
}
