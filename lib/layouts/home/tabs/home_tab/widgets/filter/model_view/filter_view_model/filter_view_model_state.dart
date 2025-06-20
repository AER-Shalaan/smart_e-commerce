import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/product_details_model/products_model.dart';

abstract class FilterViewModelState {
  
}

class FilterViewModelInitial extends FilterViewModelState {}


class FilterViewModelLoading extends FilterViewModelState {}
  
class FilterViewModelSuccess extends FilterViewModelState {
  ProductsModel productsModel;

  FilterViewModelSuccess(this.productsModel);
}

class FilterViewModelError extends FilterViewModelState {
  Failure failure;
  FilterViewModelError(this.failure);
}