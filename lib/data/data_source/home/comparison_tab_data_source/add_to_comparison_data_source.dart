import 'package:dartz/dartz.dart';
import 'package:smart_ecommerce/core/api/failure.dart';

abstract class AddToComparisonDataSource {
  Future<Either<Failure, String>> addItemToComparison({
    required String token,
    required String itemId,
    required String buyerId,
  });
}
