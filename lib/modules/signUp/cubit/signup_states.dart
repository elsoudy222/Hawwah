abstract class SignupStates {}

class SignupInitialState extends SignupStates {}

class SignupLoadingState extends SignupStates {}

class SignupSuccessState extends SignupStates {}

class SignupErrorState extends SignupStates {
  final String error;
  SignupErrorState(this.error);
}

class ChangePasswordVisibilityState extends SignupStates {}
