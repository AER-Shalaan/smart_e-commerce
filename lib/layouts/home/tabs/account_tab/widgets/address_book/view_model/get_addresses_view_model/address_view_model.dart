import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/data/data_source/home/address_data_source/get_address_data_source.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/widgets/address_book/view_model/get_addresses_view_model/address_state.dart';

@injectable
class AddressViewModel extends Cubit<AddressState> {
  final GetAddressDataSource getAddressDataSource;
  @factoryMethod
  AddressViewModel(this.getAddressDataSource) : super(AddressInitial());

  Future<void> fetchAddresses({
    required String token,
    required String userId,
  }) async {
    emit(AddressLoading());

    final result = await getAddressDataSource.getAddress(
      token: token,
      userId: userId,
    );

    result.fold(
      (failure) => emit(AddressFailure(failure.message)),
      (addresses) => emit(AddressSuccess(addresses.data)),
    );
  }
}
