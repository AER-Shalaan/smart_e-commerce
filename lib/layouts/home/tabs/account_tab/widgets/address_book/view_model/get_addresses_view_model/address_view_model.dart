import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:smart_ecommerce/config/shared_preferences.dart';
import 'package:smart_ecommerce/data/data_source/home/address_data_source/get_address_data_source.dart';
import 'package:smart_ecommerce/data/models/address_model/address.dart';
import 'package:smart_ecommerce/layouts/home/tabs/account_tab/widgets/address_book/view_model/get_addresses_view_model/address_state.dart';

@injectable
class AddressViewModel extends Cubit<AddressState> {
  final GetAddressDataSource getAddressDataSource;
  @factoryMethod
  AddressViewModel(this.getAddressDataSource) : super(AddressInitial());

  int? _selectedAddressId;

  Future<void> fetchAddresses({
    required String token,
    required String userId,
  }) async {
    emit(AddressLoading());

    final result = await getAddressDataSource.getAddress(
      token: token,
      userId: userId,
    );

    final savedId = await SharedPreferencesFunctions.getSelectedAddressId();

    result.fold((failure) => emit(AddressFailure(failure.message)), (
      addresses,
    ) {
      _selectedAddressId = savedId;
      emit(AddressSuccess(addresses.data, selectedAddressId: savedId));
    });
  }

  Future<void> selectAddress(int id, List<Address> addresses) async {
    _selectedAddressId = id;
    await SharedPreferencesFunctions.setSelectedAddressId(id);
    emit(AddressSuccess(addresses, selectedAddressId: id));
  }

  int? get selectedAddressId => _selectedAddressId;
  Address? get selectedAddress {
    if (state is AddressSuccess && _selectedAddressId != null) {
      return (state as AddressSuccess).addresses
          .where((addr) => addr.id == _selectedAddressId)
          .cast<Address?>()
          .firstOrNull;
    }
    return null;
  }
}
