import 'package:dartz/dartz.dart';
import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/profile_model/profile_model.dart';

abstract class ProfileDataSource{
  Future<Either<Failure, ProfileModel>> getProfile({required String token,required String userId});
 }