abstract class ComparisonStates {}

class ComparisonInitial extends ComparisonStates {}

class ComparisonLoading extends ComparisonStates {}

class ComparisonSuccess extends ComparisonStates {
  final Map<String, List<Map<String, dynamic>>> data;
  ComparisonSuccess(this.data);
}

class ComparisonError extends ComparisonStates {
  final String message;
  ComparisonError(this.message);
}
