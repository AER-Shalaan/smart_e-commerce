import 'package:equatable/equatable.dart';
import 'package:smart_ecommerce/data/models/home_models/categories_model/category.dart';
import 'package:smart_ecommerce/data/models/home_models/categories_model/sub_category.dart';

class FilterState extends Equatable {
  final Category? selectedCategory;
  final SubCategory? selectedSubcategory;
  final dynamic selectedItemForBorder;
  final String searchQuery;
  final double start;
  final double end;
  final String sortBy;
  final int selectedRating;

  const FilterState({
    this.selectedCategory,
    this.selectedSubcategory,
    this.selectedItemForBorder,
    this.searchQuery = '',
    this.start = 0.0,
    this.end = 100000.0,
    this.sortBy = "Newest",
    this.selectedRating = 1,
  });

  FilterState copyWith({
    Category? selectedCategory,
    SubCategory? selectedSubcategory,
    dynamic selectedItemForBorder,
    String? searchQuery,
    double? start,
    double? end,
    String? sortBy,
    int? selectedRating,
    List<int>? selectedBrands,
  }) {
    return FilterState(
      selectedCategory: selectedCategory ?? this.selectedCategory,
      selectedSubcategory: selectedSubcategory ?? this.selectedSubcategory,
      selectedItemForBorder:
          selectedItemForBorder ?? this.selectedItemForBorder,
      searchQuery: searchQuery ?? this.searchQuery,
      start: start ?? this.start,
      end: end ?? this.end,
      sortBy: sortBy ?? this.sortBy,
      selectedRating: selectedRating ?? this.selectedRating,
    );
  }

  @override
  List<Object?> get props => [
    selectedCategory,
    selectedSubcategory,
    selectedItemForBorder,
    searchQuery,
    start,
    end,
    sortBy,
    selectedRating,
  ];
}

class FilterInitial extends FilterState {
  const FilterInitial({
    super.selectedCategory,
    super.selectedSubcategory,
    super.selectedItemForBorder,
    super.searchQuery = '',
    super.start = 0.0,
    super.end = 100000.0,
    super.sortBy = "Newest",
    super.selectedRating = 1,
  });
}

class FilterLoading extends FilterState {}

class FilterSuccess extends FilterState {
  const FilterSuccess({
    super.selectedCategory,
    super.selectedSubcategory,
    super.selectedItemForBorder,
    super.searchQuery,
    super.start,
    super.end,
    super.sortBy,
    super.selectedRating,
  });
}

class FilterUpdated extends FilterState {
  const FilterUpdated({
    super.selectedCategory,
    super.selectedSubcategory,
    super.selectedItemForBorder,
    super.searchQuery,
    super.start,
    super.end,
    super.sortBy,
    super.selectedRating,
  });
}

class FilterError extends FilterState {
  final String message;
  const FilterError(this.message);

  @override
  List<Object?> get props => super.props..add(message);
}
