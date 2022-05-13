import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hawwah/models/calender_model.dart';
import 'package:hawwah/models/prediction_model.dart';
import 'package:hawwah/models/report_model.dart';
import 'package:hawwah/models/risk_model.dart';
import 'package:hawwah/modules/calender/calender_screen.dart';
import 'package:hawwah/modules/home/home_screen.dart';
import 'package:hawwah/modules/prediction/prediction_screen.dart';
import 'package:hawwah/modules/riskCalculator/risk_calculator_screen.dart';
import 'package:hawwah/shared/components/colors.dart';
import 'package:hawwah/shared/network/remote/dio_helper.dart';

import '../../modules/selfCheck/self_check_screen.dart';
import '../../shared/components/constants.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 2;
  List<Widget> activeIcons = [
    Image(
      image: const AssetImage("assets/icons/searching.png"),
      height: 30.0,
      color: thirdColor,
    ),
    Image(
      image: const AssetImage("assets/icons/calendar.png"),
      height: 30.0,
      color: thirdColor,
    ),
    Image(
      image: const AssetImage("assets/icons/home.png"),
      height: 30.0,
      color: thirdColor,
    ),
    Image(
      image: const AssetImage("assets/icons/checklist.png"),
      height: 30.0,
      color: thirdColor,
    ),
    Image(
      image: const AssetImage("assets/icons/breast.png"),
      height: 30.0,
      color: thirdColor,
    ),
  ];

  List<BottomNavigationBarItem> bottomNavItems =  [
    BottomNavigationBarItem(
      activeIcon: Image(
        image: const AssetImage("assets/icons/searching.png"),
        height: 30.0,
        color: thirdColor,
      ),
      icon: const Image(
        image: AssetImage("assets/icons/searching.png"),
        height: 30.0,
        color: Colors.black87,
      ),
      label: "",
    ),
    BottomNavigationBarItem(
      activeIcon: Image(
        image: const AssetImage("assets/icons/calendar.png"),
        height: 30.0,
        color: thirdColor,
      ),
      icon: const Image(
        image:  AssetImage("assets/icons/calendar.png"),
        height: 30.0,
        color: Colors.black87,
      ),
      label: "",
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.circle,
        color: Colors.transparent,
      ),
      label: "",
    ),
    BottomNavigationBarItem(
      activeIcon: Image(
        image: const AssetImage("assets/icons/checklist.png"),
        height: 30.0,
        color: thirdColor,
      ),
      icon: const Image(
        image:  AssetImage("assets/icons/checklist.png"),
        height: 30.0,
        color: Colors.black87,
      ),
      label: "",
    ),
    BottomNavigationBarItem(
      activeIcon: Image(
        image: const AssetImage("assets/icons/breast.png"),
        height: 30.0,
        color: thirdColor,
      ),
      icon: const Image(
        image:  AssetImage("assets/icons/breast.png"),
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

PredictionModel ?predictionModel;
  void sendPredictionData({
    required String perimeter_mean,
    required String area_mean,
    required String area_se,
    required String perimeter_worst,
    required String area_worst,
  }) {
    emit(LoadingPredictionDataState());
    DioHelper.postData(
      url: '/predict/',
      token: token,
      data: {
        "perimeter_mean": perimeter_mean,
        "area_mean": area_mean,
        "area_se": area_se,
        "perimeter_worst": perimeter_worst,
        "area_worst": area_worst
      },
    ).then((value) {
      predictionModel = PredictionModel.fromJson(value.data) ;
      emit(SuccessPredictionDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorPredictionDataState());
    });
  }

  RiskModel? riskModel;
  //String toke='eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjUyNDY2MTA3LCJpYXQiOjE2NTI0NTQxMDcsImp0aSI6IjNiZGE4MTRlNjNjNjQzY2RhMTQ0YWZkNzI1YThkOTQyIiwidXNlcl9pZCI6MTF9.nIzWGVUqJlGxlH1ncAdnKE_RXpqw_g-mAU0R5xDx7-M';
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
      url: '/risk_calculator/',
      token: token,
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

  CalenderModel ?calenderModel;
  void sendCalenderData({
    required String data,
  }) {
    emit(LoadingCalenderDataState());
    DioHelper.postData(
      url: '/exam/calender/',
      token: token,
      data: {
        "period": data,
        "self_check": "0"
      },
    ).then((value) {
      print(value);
      calenderModel =CalenderModel.fromJson(value.data);
      print(calenderModel!.date!.dates![0].isCheck);
      emit(SuccessCalenderDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorCalenderDataState());
    });
  }
  void getCalenderData() {
    emit(LoadingCalenderDataState());
    DioHelper.getData(
      url: '/exam/calender/?page=35081069',
      token: token,
    ).then((value) {
      print(value);
      calenderModel =CalenderModel.fromJson(value.data);
      print(calenderModel!.date!.dates![0].isCheck);
      emit(SuccessCalenderDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorCalenderDataState());
    });
  }
  ReportModel ?reportModel;
  void getReportData() {
    emit(LoadingReportDataState());
    DioHelper.getData(
      url: '/exam/report/',
      token: token,
    ).then((value) {
      print(value);
      reportModel =ReportModel.fromJson(value.data);
      print(reportModel!.questions![0].date);
      emit(SuccessReportDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorReportDataState());
    });
  }


}
