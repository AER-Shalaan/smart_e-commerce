import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/data_source/home/home_tap_data_source/categories_data_source.dart';
import 'package:smart_ecommerce/data/models/home_models/categories_model/Categories.dart';
import 'package:smart_ecommerce/layouts/home/tabs/home_tab/widgets/categorys/model_view/categories_states.dart';

@injectable
class CategoriesViewModel extends Cubit<CategoriesState> {
  final CategoriesDataSource dataSource;

  @factoryMethod
  CategoriesViewModel(this.dataSource) : super(CategoriesLoadingState());

  Future<void> getCategories(String token) async {
    emit(CategoriesLoadingState());
    final result = await dataSource.getCategories(token: token);
    result.fold(
      (Failure failure) => emit(CategoriesErrorState(failure.message)),
      (List<Categories> list) => emit(CategoriesSuccessState(list)),
    );
  }
}
