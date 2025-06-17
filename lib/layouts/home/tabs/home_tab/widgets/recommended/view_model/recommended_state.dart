import 'package:equatable/equatable.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/product_details_model/recommended_products_model.dart';

abstract class RecommendedState extends Equatable {
  const RecommendedState();

  @override
  List<Object?> get props => [];
}

class RecommendedInitial extends RecommendedState {}

class RecommendedLoading extends RecommendedState {}

class RecommendedLoaded extends RecommendedState {
  final RecommendedProductsModel products;
  const RecommendedLoaded(this.products);

  @override
  List<Object?> get props => [products];
}

class RecommendedError extends RecommendedState {
  final Failure message;
  const RecommendedError(this.message);

  @override
  List<Object?> get props => [message];
}
