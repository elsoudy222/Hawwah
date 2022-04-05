import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hawwah/models/login_model.dart';
import 'package:hawwah/shared/network/remote/dio_helper.dart';

import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context)=> BlocProvider.of(context);

  LoginModel? loginModel;
  void userLogin({
    required String email,
    required String password,
}){
    emit(LoginLoadingState());
    DioHelper.postData(
        url: "login/",
        data: {
          "email": email,
          "password": password,

        },
    ).then((value){
      print(value.data);
      loginModel = LoginModel.fromJson(value.data);
      print(loginModel!.userData!.email);
      emit(LoginSuccessState(loginModel!));
    }).catchError((error){
      emit(LoginErrorState(error.toString()));
    });
  }


  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }

}