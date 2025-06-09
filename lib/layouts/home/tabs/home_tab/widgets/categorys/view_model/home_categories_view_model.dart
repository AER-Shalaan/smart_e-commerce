import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/data_source/home/home_tap_data_source/categories_data_source.dart';
import 'package:smart_ecommerce/data/models/home_models/categories_model/category.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/categorys/view_model/home_categories_states.dart';

@injectable
class HomeCategoriesViewModel extends Cubit<HomeCategoriesState> {
  final CategoriesDataSource dataSource;

  @factoryMethod
  HomeCategoriesViewModel(this.dataSource) : super(HomeCategoriesLoadingState());

  Future<void> getCategories(String token) async {
    emit(HomeCategoriesLoadingState());
    final result = await dataSource.getCategories(token: token);
    result.fold(
      (Failure failure) => emit(HomeCategoriesErrorState(failure.message)),
      (List<Category> list) => emit(HomeCategoriesSuccessState(list)),
    );
  }
}
