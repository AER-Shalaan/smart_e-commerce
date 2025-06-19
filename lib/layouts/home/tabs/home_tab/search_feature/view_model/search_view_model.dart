import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/data/data_source/home/home_tap_data_source/search_data_source.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/search_feature/view_model/search_view_model_state.dart';

@injectable
class SearchTabViewModel extends Cubit<SearchTabStates> {
  SearchTabViewModel(this.searchDataSource) : super(SearchTabInitialState());
  @factoryMethod
  SearchDataSource searchDataSource;
  static SearchTabViewModel getObject(BuildContext context) =>
      BlocProvider.of(context);
  search({required String query, required int page,required String token,required String userId}) async {
    emit(SearchTabLoadingState());
    // if (query == "") {
    //   emit(SearchTabErrorState(Failure.));
    // }
    var result = await searchDataSource.search(page: page,query: query,token: token,userId: userId);
    result.fold(
      (response) {
        emit(SearchTabErrorState(response));
      },
      (error) {
        emit(SearchTabSuccessState(error));
      },
    );
  }
}


