import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hawwah/models/register_model.dart';

import '../../../shared/network/end_points.dart';
import '../../../shared/network/remote/dio_helper.dart';
import 'signup_states.dart';

class SignupCubit extends Cubit<SignupStates>{
  SignupCubit() : super(SignupInitialState());

  static SignupCubit get(context)=> BlocProvider.of(context);

 RegisterModel? registerModel;

   void userRegister({

    required String email,
    required String password,
    required String firstName,
     required String lastName,
    required String phone,
     required String birthdate,
  }){
     emit(SignupLoadingState());
     DioHelper.postData(
         url: REGISTER,
         data:{
           'email':email,
           'password':password,
           'phone':phone,
           "firstName":firstName,
           "lastName":lastName,
           'birthdate':birthdate,
         },

     ).then((value){
       print(value.data);
       registerModel = RegisterModel.fromJson(value.data);
        print(registerModel!.data!.message);
       emit(SignupSuccessState(registerModel!));
     }).catchError((error){
       print(error.toString());
       emit(SignupErrorState(error.toString()));
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