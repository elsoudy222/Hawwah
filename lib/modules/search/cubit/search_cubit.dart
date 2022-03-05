import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context)=> BlocProvider.of(context);




  void search(String text){
    emit(SearchLoadingState());
    // DioHelper.post(
    //   url: SEARCH,
    //   token: token,
    //   data:
    //   {
    //     'text': text,
     //},
     //).then((value) {
    //   model = SearchModel.fromJson(value.data);
    //  emit(SearchSuccessState());
   // }).catchError((error){
     // emit(SearchErrorState());
   // });
  }
}
