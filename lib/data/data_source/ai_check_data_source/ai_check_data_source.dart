import 'package:dartz/dartz.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/ai_checks_model/ai_check_model.dart';

abstract class AICheckDataSource {
  Future<Either<Failure, AICheckModel>> getAICheckData({
    required String text,  
  });
}