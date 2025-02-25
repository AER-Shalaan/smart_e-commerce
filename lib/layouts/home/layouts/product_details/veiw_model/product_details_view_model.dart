import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/data/data_source/home/product_details_data_source/product_details_data.dart';
import 'package:smart_ecommerce/layouts/home/layouts/product_details/veiw_model/product_details_view_model_states.dart';
@injectable
class ProductDetailsViewModel extends Cubit<ProductDetailsViewModelStates> {
  ProductDetailsDataSource productDetailsDataSource;
  @factoryMethod
  ProductDetailsViewModel(this.productDetailsDataSource)
      : super(ProductDetailsInitialState());

  Future<void> getProductDetails(
      {required String productId, required String token}) async {
    emit(ProductDetailsLoadingState());
    var response = await productDetailsDataSource.getProductDetails(
        productId: productId, token: token);
    response.fold((productDetails) {
      emit(ProductDetailsSuccessState(productDetails));
    }, (error) {
      emit(ProductDetailsErrorState(error));
    });
  }
}
