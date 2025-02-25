import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/products.dart';
import 'comparison_states.dart';

class ComparisonCubit extends Cubit<ComparisonStates> {
  ComparisonCubit() : super(ComparisonInitial());

  final List<Map<String, dynamic>> selectedProducts = allProducts;

  void addToComparison(Map<String, dynamic> product) {
    if (!selectedProducts.contains(product)) {
      emit(Comparisonloading());
      selectedProducts.add(product);
      emit(ComparisonSuccess());
    }
  }

  void removeFromComparison(Map<String, dynamic> product) {
    if (selectedProducts.contains(product)) {
      emit(Comparisonloading());
      selectedProducts.remove(product);
      emit(ComparisonSuccess());
    }
  }

  void clearComparison() {
    emit(Comparisonloading());
    selectedProducts.clear();
    emit(ComparisonSuccess());
  }
}
