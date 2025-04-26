import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/data/data_source/home/home_tap_data_source/best_seller_data_source.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/best_seller/view_model/best_seller_view_model_states.dart';

@injectable
class BestSellerViewModel extends Cubit<BestSellerViewModelStates> {
  BestSellerViewModel(this.bestSellerDataSource) : super(BestSellerInitState());
  @factoryMethod
  final BestSellerDataSource bestSellerDataSource;
  static BestSellerViewModel get(BuildContext context) =>
      BlocProvider.of(context);

  Future<void> getBestSeller({required String token}) async {
    emit(BestSellerLoadingState());
    await bestSellerDataSource
        .getMostSelling(token: token)
        .then(
          (value) => value.fold(
            (l) => emit(BestSellerSuccessState(l)),
            (r) => emit(BestSellerErrorState(r)),
          ),
        );
  }
}
