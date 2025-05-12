import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/data/data_source/home/home_tap_data_source/top_rated_data_source.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/top_rated_product/view_model/top_rated_view_model_states.dart';

@injectable
class TopRatedViewModel extends Cubit<TopRatedViewModelStates> {
  TopRatedViewModel(this.topRatedDataSource) : super(TopRatedInitState());
  @factoryMethod
  final TopRatedDataSource topRatedDataSource;
  static TopRatedViewModel get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> getTopRated({required String token}) async {
    emit(TopRatedLoadingState());
    await topRatedDataSource
        .getTopRated(token: token)
        .then(
          (value) => value.fold(
            (failure) => emit(TopRatedErrorState(failure.message)),
            (productList) => emit(TopRatedSuccessState(productList)),
          ),
        );
  }
}