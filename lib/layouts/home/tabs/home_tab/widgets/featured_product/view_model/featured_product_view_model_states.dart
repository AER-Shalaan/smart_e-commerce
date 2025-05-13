import 'package:equatable/equatable.dart';
import 'package:smart_ecommerce/data/models/home_models/produdts_model/Products.dart';

abstract class FeaturedProductViewModelStates extends Equatable{
  const FeaturedProductViewModelStates();

  @override
  List<Object> get props => [];
}

class FeaturedProductInitialState extends FeaturedProductViewModelStates{}

class FeaturedProductLoadingState extends FeaturedProductViewModelStates{}

class FeaturedProductSuccessState extends FeaturedProductViewModelStates{
  final List<Products> featuredProductModel;
  const FeaturedProductSuccessState(this.featuredProductModel);

  @override
  List<Object> get props => [featuredProductModel];
}

class FeaturedProductErrorState extends FeaturedProductViewModelStates{
  final String errorMessage;
  const FeaturedProductErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
