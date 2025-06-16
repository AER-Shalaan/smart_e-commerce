class AddItemViewModel {
  final String message;
  final String display;

  AddItemViewModel({required this.message, required this.display});

  factory AddItemViewModel.fromJson(Map<String, dynamic> json) {
    return AddItemViewModel(message: json['message'], display: json['display']);
  }
}
