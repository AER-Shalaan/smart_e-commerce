abstract class AddAddressState {}

class AddAddressInitial extends AddAddressState {}

class AddAddressLoading extends AddAddressState {}

class AddAddressSuccess extends AddAddressState {
  final String message;
  AddAddressSuccess(this.message);
}

class AddAddressFailure extends AddAddressState {
  final String error;
  AddAddressFailure(this.error);
}
