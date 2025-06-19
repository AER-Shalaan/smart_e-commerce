import 'package:smart_ecommerce/core/api/failure.dart';
import 'package:smart_ecommerce/data/models/profile_model/ProfileModel.dart';

abstract class ProfileViewModelState {
  
}

class ProfileViewModelInitial extends ProfileViewModelState {}

class ProfileViewModelLoading extends ProfileViewModelState {}

class ProfileViewModelSuccess extends ProfileViewModelState {
  ProfileModel profileModel;

  ProfileViewModelSuccess(this.profileModel);
}

class ProfileViewModelError extends ProfileViewModelState {
  Failure failure;

  ProfileViewModelError(this.failure);
}