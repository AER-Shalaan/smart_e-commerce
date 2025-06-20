class AddAddressRequestModel {
  final String apartment;
  final String floor;
  final String street;
  final String building;
  final String city;
  final String state;

  AddAddressRequestModel({
    required this.apartment,
    required this.floor,
    required this.street,
    required this.building,
    required this.city,
    required this.state,
  });

  Map<String, dynamic> toJson() {
    return {
      "apartment": apartment,
      "floor": floor,
      "street": street,
      "building": building,
      "city": city,
      "state": state,
    };
  }

  factory AddAddressRequestModel.fromJson(Map<String, dynamic> json) {
    return AddAddressRequestModel(
      apartment: json['apartment'] ?? '',
      floor: json['floor'] ?? '',
      street: json['street'] ?? '',
      building: json['building'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
    );
  }
}
