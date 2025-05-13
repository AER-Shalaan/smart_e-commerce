import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/data/data_source/home/home_tap_data_source/featured_product_data_source.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/featured_product/view_model/featured_product_view_model_states.dart';

@injectable
class FeaturedProductViewModel extends Cubit<FeaturedProductViewModelStates> {
  FeaturedProductViewModel(this.featuredProductDataSource)
    : super(FeaturedProductInitialState());
  @factoryMethod
  final FeaturedProductDataSource featuredProductDataSource;
  static FeaturedProductViewModel get(BuildContext context) =>
      BlocProvider.of(context);
  Future<void> getFeaturedProducts({required String token}) async {
    emit(FeaturedProductLoadingState());
    await featuredProductDataSource
        .getFeaturedProducts(token: token)
        .then(
          (value) => value.fold(
            (failure) => emit(FeaturedProductErrorState(failure.message)),
            (productList) => emit(FeaturedProductSuccessState(productList)),
          ),
        );
  }
}
