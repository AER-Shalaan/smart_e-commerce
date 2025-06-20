import 'package:smart_ecommerce/data/models/address_model/address.dart';

abstract class AddressState {}

class AddressInitial extends AddressState {}

class AddressLoading extends AddressState {}

class AddressSuccess extends AddressState {
  final List<Address> addresses;

  AddressSuccess(this.addresses);
}

class AddressFailure extends AddressState {
  final String message;
  AddressFailure(this.message);
}
