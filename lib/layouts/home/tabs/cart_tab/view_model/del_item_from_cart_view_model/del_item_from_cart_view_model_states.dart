abstract class DelItemFromCartViewModelStates {}

class DelItemFromCartInitialState extends DelItemFromCartViewModelStates {}

class DelItemFromCartLoadingState extends DelItemFromCartViewModelStates {
  final String deletingItemId;
  DelItemFromCartLoadingState(this.deletingItemId);
}

class DelItemFromCartSuccessState extends DelItemFromCartViewModelStates {}

class DelItemFromCartErrorState extends DelItemFromCartViewModelStates {
  final String errorMessage;
  DelItemFromCartErrorState({required this.errorMessage});
}
