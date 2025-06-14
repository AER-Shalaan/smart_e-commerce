import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/data_source/home/home_tap_data_source/subcategories_from_category_data_source.dart';
import 'package:smart_ecommerce/data/models/home_models/categories_model/sub_category.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/filter/model_view/subcategories_from_category_view_model/subcategories_from_category_states.dart';

@injectable
class SubcategoriesFromCategoryViewModel extends Cubit<SubcategoriesFromCategoryStates> {
  final SubcategoriesFromCategoryDataSource dataSource;

  @factoryMethod
  SubcategoriesFromCategoryViewModel(this.dataSource) : super(SubcategoriesFromCategoryLoadingState());

  Future<void> getCategories(String token , int categoryId) async {
    emit(SubcategoriesFromCategoryLoadingState());
    final result = await dataSource.getSubCategories(token: token, categoryId: categoryId);
    result.fold(
      (Failure failure) => emit(SubcategoriesFromCategoryErrorState(failure.message)),
      (List<SubCategory> list) => emit(SubcategoriesFromCategorySuccessState(list)),
    );
  }
}
