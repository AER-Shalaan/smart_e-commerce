import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/core/api/api_manager.dart';
import 'package:smart_ecommerce/core/api/end_points.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/data_source/ai_check_data_source/ai_check_data_source.dart';
import 'package:smart_ecommerce/data/models/ai_checks_model/ai_check_model.dart';

@Injectable(as: AICheckDataSource)
class AiCheckDataSourceImpl extends AICheckDataSource {
  final ApiManger apiManger;

  @factoryMethod
  AiCheckDataSourceImpl(this.apiManger);

  @override
  Future<Either<Failure, AICheckModel>> getAICheckData({required String text}) {
    return apiManger
        .postRequestAI(endPoints: EndPoints.checkReview, body: {"text": text})
        .then(
          (value) => value.fold(
            (failure) => Left(failure),
            (response) => Right(AICheckModel.fromJson(response.data)),
          ),
        );
  }
}
