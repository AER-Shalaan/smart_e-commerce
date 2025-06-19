import 'package:dartz/dartz.dart';
import 'package:smart_ecommerce/core/api/failure.dart';

abstract class ComparisonDataSource {
  Future<Either<Failure, Map<String, List<Map<String, dynamic>>>>> getComparisonLists({
    required String buyerId,
    required String token,
  });
   Future<Either<Failure, String>> removeItemFromComparison({
    required String itemId,
    required String buyerId,
    required String token,
  });
}
