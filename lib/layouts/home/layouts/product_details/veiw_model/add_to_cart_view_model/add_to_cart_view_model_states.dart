abstract class AddToCartViewModelStates {}

class AddToCartInitial extends AddToCartViewModelStates {}

class AddToCartLoadingState extends AddToCartViewModelStates {}

class AddToCartSuccessState extends AddToCartViewModelStates {
  final String message;
  AddToCartSuccessState(this.message);
}

class AddToCartErrorState extends AddToCartViewModelStates {
  final String errorMessage;
  AddToCartErrorState(this.errorMessage);
}
