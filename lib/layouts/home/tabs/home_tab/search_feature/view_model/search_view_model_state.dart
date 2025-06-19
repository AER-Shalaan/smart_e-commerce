import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/product_details_model/products_model.dart';

abstract class SearchTabStates {}

class SearchTabInitialState extends SearchTabStates {}

class SearchTabLoadingState extends SearchTabStates {}

class SearchTabSuccessState extends SearchTabStates {
  ProductsModel searchResult;
  SearchTabSuccessState(this.searchResult);
}

class SearchTabErrorState extends SearchTabStates {
  Failure error;
  SearchTabErrorState(this.error);
}