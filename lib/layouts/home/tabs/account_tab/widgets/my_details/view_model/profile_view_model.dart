import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/data/data_source/home/account_tab_data_source/profile_data_source/profile_data_source.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/widgets/my_details/view_model/profile_view_model_state.dart';
@injectable
class ProfileViewModel extends Cubit<ProfileViewModelState> {
  ProfileViewModel(this.profileDataSource) : super(ProfileViewModelInitial());
  @factoryMethod
  ProfileDataSource profileDataSource;

  Future<void> getProfile({required String token,required String userId}) async {
    emit(ProfileViewModelLoading());
    final response = await profileDataSource.getProfile(token: token, userId: userId);
    response.fold((l) => emit(ProfileViewModelError(l)), (r) => emit(ProfileViewModelSuccess(r)));
  }
}