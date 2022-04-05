import 'package:hawwah/models/login_model.dart';

abstract class SignupStates {}

class SignupInitialState extends SignupStates {}

class SignupLoadingState extends SignupStates {}

class SignupSuccessState extends SignupStates {
  LoginModel loginModel;
  SignupSuccessState(this.loginModel);
}

class SignupErrorState extends SignupStates {
  final String error;
  SignupErrorState(this.error);
}

class ChangePasswordVisibilityState extends SignupStates {}
