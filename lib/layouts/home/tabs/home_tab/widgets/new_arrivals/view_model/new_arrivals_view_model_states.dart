import 'package:equatable/equatable.dart';
import 'package:smart_ecommerce/data/models/home_models/produdts_model/Products.dart';

abstract class NewArrivalsViewModelStates extends Equatable {
  const NewArrivalsViewModelStates();

  @override
  List<Object?> get props => [];
}

class NewArrivalsInitialState extends NewArrivalsViewModelStates {}

class NewArrivalsLoadingState extends NewArrivalsViewModelStates {}

class NewArrivalsErrorState extends NewArrivalsViewModelStates {
  final String errorMessage;
  const NewArrivalsErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class NewArrivalsSuccessState extends NewArrivalsViewModelStates {
  final List<Products> newArrivalsModel;
  const NewArrivalsSuccessState(this.newArrivalsModel);

  @override
  List<Object> get props => [newArrivalsModel];
}
