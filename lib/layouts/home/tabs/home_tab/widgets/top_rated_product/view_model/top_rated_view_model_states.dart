import 'package:equatable/equatable.dart';
import 'package:smart_ecommerce/data/models/home_models/produdts_model/Products.dart';

abstract class TopRatedViewModelStates extends Equatable {
  const TopRatedViewModelStates();

  @override
  List<Object?> get props => [];
}

class TopRatedInitState extends TopRatedViewModelStates {}

class TopRatedLoadingState extends TopRatedViewModelStates {}

class TopRatedErrorState extends TopRatedViewModelStates {
  final String errorMessage;
  const TopRatedErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class TopRatedSuccessState extends TopRatedViewModelStates {
  final List<Products> topRatedModel;
  const TopRatedSuccessState(this.topRatedModel);

  @override
  List<Object> get props => [topRatedModel];
}
