abstract class AddToComparisonStates {}

class AddToComparisonInitial extends AddToComparisonStates {}

class AddToComparisonLoading extends AddToComparisonStates {}

class AddToComparisonSuccess extends AddToComparisonStates {
  final String message;
  AddToComparisonSuccess(this.message);
}

class AddToComparisonError extends AddToComparisonStates {
  final String error;
  AddToComparisonError(this.error);
}
