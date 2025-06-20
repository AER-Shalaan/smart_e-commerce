import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/ai_checks_model/ai_check_model.dart';

abstract class CheckReviewState {}

class CheckReviewInitial extends CheckReviewState {}

class CheckReviewLoadingState extends CheckReviewState {}

class CheckReviewSuccessState extends CheckReviewState {
  final AICheckModel aiCheckModel;
  CheckReviewSuccessState(this.aiCheckModel);
}

class CheckReviewErrorState extends CheckReviewState {
  final Failure failure;
  CheckReviewErrorState(this.failure);
}
