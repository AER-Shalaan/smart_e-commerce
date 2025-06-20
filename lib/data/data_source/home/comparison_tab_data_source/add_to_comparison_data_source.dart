import 'package:smart_ecommerce/data/models/add_to_comparison_model/add_to_comparison_model.dart';

abstract class AddToComparisonDataSource {
  Future<AddToComparisonModel> addItemToComparison({
    required String token,
    required String itemId,
    required String buyerId,
  });
}
