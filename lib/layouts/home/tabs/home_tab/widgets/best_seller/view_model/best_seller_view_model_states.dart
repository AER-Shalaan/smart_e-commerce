import 'package:equatable/equatable.dart';
import 'package:smart_ecommerce/data/models/home_models/produdts_model/Products.dart';

abstract class BestSellerViewModelStates extends Equatable {
  const BestSellerViewModelStates();

  @override
  List<Object?> get props => [];
}

class BestSellerInitState extends BestSellerViewModelStates {}

class BestSellerLoadingState extends BestSellerViewModelStates {}

class BestSellerErrorState extends BestSellerViewModelStates {
  final String errorMessage;
  const BestSellerErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class BestSellerSuccessState extends BestSellerViewModelStates {
  final List<Products> bestSellerModel;
  const BestSellerSuccessState(this.bestSellerModel);

  @override
  List<Object> get props => [bestSellerModel];
}
