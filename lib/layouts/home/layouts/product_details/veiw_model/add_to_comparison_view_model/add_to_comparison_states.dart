import 'package:smart_ecommerce/data/models/add_to_comparison_model/add_to_comparison_model.dart';

abstract class AddToComparisonStates {}

class AddToComparisonInitial extends AddToComparisonStates {}

class AddToComparisonLoading extends AddToComparisonStates {}

class AddToComparisonSuccess extends AddToComparisonStates {
  final AddToComparisonModel response;
  AddToComparisonSuccess(this.response);
}

class AddToComparisonError extends AddToComparisonStates {
  final AddToComparisonModel response;
  AddToComparisonError(this.response);
}
