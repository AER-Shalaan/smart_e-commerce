import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/category_model.dart';
import '../models/subcategory_model.dart';
import 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(const FilterInitial());

  void initializeFilters() {
    emit(const FilterSuccess(
        selectedCategory: null,
        selectedSubcategory: null,
        selectedItemForBorder: null,
        searchQuery: '',
        start: 0.0,
        end: 100000.0,
        sortBy: "Newest",
        selectedRating: 1,
        selectedBrands: []));
  }

  void setCategory(Category category) {
    emit(state.copyWith(selectedCategory: category));
  }

  void setSubcategory(Subcategory subcategory) {
    emit(state.copyWith(selectedSubcategory: subcategory));
  }

  void setSelectedItemForBorder(dynamic item) {
    emit(state.copyWith(selectedItemForBorder: item));
  }

  void updateSearchQuery(String query) {
    emit(state.copyWith(searchQuery: query));
  }

  void updateRange(double newStart, double newEnd) {
    emit(state.copyWith(start: newStart, end: newEnd));
  }

  void setSortBy(String option) {
    emit(state.copyWith(sortBy: option));
  }

  void setRating(int rating) {
    emit(state.copyWith(selectedRating: rating));
  }

  void toggleBrand(int brandId) {
    List<int> updatedBrands = List.from(state.selectedBrands);
    if (updatedBrands.contains(brandId)) {
      updatedBrands.remove(brandId);
    } else {
      updatedBrands.add(brandId);
    }
    emit(state.copyWith(selectedBrands: updatedBrands));
  }

  void clearFilters() {
    emit(const FilterInitial(
        selectedCategory: null,
        selectedSubcategory: null,
        selectedItemForBorder: null,
        searchQuery: '',
        start: 0.0,
        end: 100000.0,
        sortBy: "Newest",
        selectedRating: 1,
        selectedBrands: []));
  }

  void clearSubFilters() {
    emit(state.copyWith(
        start: 0.0,
        end: 100000.0,
        sortBy: "Newest",
        selectedRating: 1,
        selectedBrands: []));
  }
}
