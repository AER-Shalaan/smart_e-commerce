import 'package:dartz/dartz.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/product_details_model/add_item_view_model.dart';

abstract class AddItemViewDataSource {
  Future<Either<Failure,AddItemViewModel>> addItemView({
    required String token,
    required int userId,
    required String itemId
  });
}