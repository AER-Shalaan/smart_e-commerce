
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/data/data_source/home/home_tap_data_source/filter_data_source.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/filter/model_view/filter_view_model/filter_view_model_state.dart';

@injectable
class FilterViewModel extends Cubit<FilterViewModelState> {
  FilterDataSource filterDataSource;
  @factoryMethod
  FilterViewModel(this.filterDataSource) : super(FilterViewModelInitial());

  static FilterViewModel getObject(BuildContext context) =>
      BlocProvider.of(context);

  void getFilteredData({
    required String token,
     int? categoryId,
     int? subCategoryId,
     double? maxPrice,
     double? minPrice,
     int? rate,
     bool? mostViewed,
     bool? newwest,
     bool? mostSold,
    required int page,
  }) async {
    emit(FilterViewModelLoading());
    var response = await filterDataSource.getFilteredData(
      token: token,
      categoryId: categoryId,
      subCategoryId: subCategoryId,
      maxPrice: maxPrice,
      minPrice: minPrice,
      rate: rate,
      mostViewed: mostViewed,
      newwest: newwest,
      mostSold: mostSold,
      page: page,
    );
    response.fold((failure) => emit(FilterViewModelError(failure)), (response) {
       
      emit(FilterViewModelSuccess(response));
    });
  }
}
