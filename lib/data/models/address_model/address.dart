class Address {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String country;
  final String state;
  final String city;
  final String postalCode;
  final String street;
  final String building;
  final String floor;
  final String apartment;
  final String shippingMethod;
  final int userId;

  Address({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.country,
    required this.state,
    required this.city,
    required this.postalCode,
    required this.street,
    required this.building,
    required this.floor,
    required this.apartment,
    required this.shippingMethod,
    required this.userId,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['Id'],
      firstName: json['FirstName'],
      lastName: json['LastName'],
      email: json['Email'],
      phoneNumber: json['PhoneNumber'],
      country: json['Country'],
      state: json['State'],
      city: json['City'],
      postalCode: json['PostalCode'],
      street: json['Street'],
      building: json['Building'],
      floor: json['Floor'],
      apartment: json['Apartment'],
      shippingMethod: json['ShippingMethod'],
      userId: json['UserId'],
    );
  }
}
