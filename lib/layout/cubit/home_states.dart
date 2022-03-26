part of 'home_cubit.dart';

@immutable
abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class ChangeBottomNavBarState extends HomeStates {}

class LoadingPredictionDataState extends HomeStates {}

class SuccessPredictionDataState extends HomeStates {}

class ErrorPredictionDataState extends HomeStates {}
