class Adresses {
  Adresses({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.email, 
      this.phoneNumber, 
      this.country, 
      this.state, 
      this.city, 
      this.postalCode, 
      this.street, 
      this.building, 
      this.floor, 
      this.apartment, 
      this.shippingMethod, 
      this.userId,});

  Adresses.fromJson(dynamic json) {
    id = json['Id'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    email = json['Email'];
    phoneNumber = json['PhoneNumber'];
    country = json['Country'];
    state = json['State'];
    city = json['City'];
    postalCode = json['PostalCode'];
    street = json['Street'];
    building = json['Building'];
    floor = json['Floor'];
    apartment = json['Apartment'];
    shippingMethod = json['ShippingMethod'];
    userId = json['UserId'];
  }
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? country;
  String? state;
  String? city;
  String? postalCode;
  String? street;
  String? building;
  String? floor;
  String? apartment;
  String? shippingMethod;
  String? userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id'] = id;
    map['FirstName'] = firstName;
    map['LastName'] = lastName;
    map['Email'] = email;
    map['PhoneNumber'] = phoneNumber;
    map['Country'] = country;
    map['State'] = state;
    map['City'] = city;
    map['PostalCode'] = postalCode;
    map['Street'] = street;
    map['Building'] = building;
    map['Floor'] = floor;
    map['Apartment'] = apartment;
    map['ShippingMethod'] = shippingMethod;
    map['UserId'] = userId;
    return map;
  }

}