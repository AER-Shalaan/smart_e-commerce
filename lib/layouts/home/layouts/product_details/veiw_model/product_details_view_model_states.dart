import 'package:smart_ecommerce/data/models/product_details_model/ProductDetailsModel.dart';

abstract class ProductDetailsViewModelStates {}

class ProductDetailsInitialState extends ProductDetailsViewModelStates {}

class ProductDetailsLoadingState extends ProductDetailsViewModelStates {}

class ProductDetailsErrorState extends ProductDetailsViewModelStates {
  final String errorMessage;

  ProductDetailsErrorState(this.errorMessage);
}

class ProductDetailsSuccessState extends ProductDetailsViewModelStates {
  final ProductDetailsModel productDetailsModel;

  ProductDetailsSuccessState(this.productDetailsModel);
}
