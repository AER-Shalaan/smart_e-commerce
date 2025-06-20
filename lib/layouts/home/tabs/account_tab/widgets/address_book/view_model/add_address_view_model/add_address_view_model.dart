import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/data/data_source/home/address_data_source/add_address_data_source.dart';
import 'package:smart_ecommerce/data/models/address_model/add_address_model/add_address_request_model.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/widgets/address_book/view_model/add_address_view_model/add_address_states.dart';

@injectable
class AddAddressCubit extends Cubit<AddAddressState> {
  final AddAddressDataSource addAddressDataSource;
  @factoryMethod
  AddAddressCubit(this.addAddressDataSource) : super(AddAddressInitial());

  Future<void> addAddress({
    required String token,
    required String userId,
    required AddAddressRequestModel address,
  }) async {
    emit(AddAddressLoading());

    final result = await addAddressDataSource.addAddress(
      token: token,
      userId: userId,
      address: address,
    );

    result.fold(
      (failure) => emit(AddAddressFailure(failure.message)),
      (successMsg) => emit(AddAddressSuccess(successMsg)),
    );
  }
}
