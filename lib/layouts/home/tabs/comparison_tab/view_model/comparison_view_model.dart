import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/resuebale_componants/app_snack_bar.dart';
import 'package:smart_ecommerce/data/data_source/home/comparison_tab_data_source/comparison_data_source.dart';
import 'package:smart_ecommerce/layouts/home/tabs/comparison_tab/view_model/comparison_states.dart';

@injectable
class ComparisonViewModel extends Cubit<ComparisonStates> {
  final ComparisonDataSource dataSource;
  @factoryMethod
  ComparisonViewModel(this.dataSource) : super(ComparisonInitial());

  Future<void> fetchComparisons({
    required String buyerId,
    required String token,
  }) async {
    emit(ComparisonLoading());

    final result = await dataSource.getComparisonLists(
      buyerId: buyerId,
      token: token,
    );

    result.fold(
      (failure) => emit(ComparisonError(failure.message)),
      (data) => emit(ComparisonSuccess(data)),
    );
  }

  Future<void> removeItem({
    required String itemId,
    required String buyerId,
    required String token,
    required String currentCategory,
    required BuildContext context, // لازم تبعت الـ context عشان الـ SnackBar
  }) async {
    emit(ComparisonLoading());
    final result = await dataSource.removeItemFromComparison(
      itemId: itemId,
      buyerId: buyerId,
      token: token,
    );
    result.fold((failure) => emit(ComparisonError(failure.message)), (
      msg,
    ) async {
      AppSnackBar.show(
        context: context,
        message: "Deleted from comparison successfully!",
        icon: Icons.delete_forever,
        backgroundColor: Theme.of(context).colorScheme.primary,
      );
      await fetchComparisons(buyerId: buyerId, token: token);
    });
  }
}
