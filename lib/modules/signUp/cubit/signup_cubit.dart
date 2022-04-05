import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hawwah/models/login_model.dart';

import '../../../shared/network/remote/dio_helper.dart';
import 'signup_states.dart';

class SignupCubit extends Cubit<SignupStates>{
  SignupCubit() : super(SignupInitialState());

  static SignupCubit get(context)=> BlocProvider.of(context);

   LoginModel? loginModel;

   void userRegister({
    required String email,
    required String password,
    required String firstName,
     required String lastName,
    required String phone,
  }){

     DioHelper.postData(
         url: "register/",
         data:{
           'email':email,
           'password':password,
           'phone':phone,
          // 'name':name,
         }
     ).then((value){
       print(value.data);
       loginModel = LoginModel.fromJson(value.data);

      // emit(RegisterSuccessState(loginModel));
     }).catchError((error){
      // emit(RegisterErrorState(error.toString()));
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