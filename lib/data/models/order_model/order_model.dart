class OrderModel {
  final int idFromPaymob;
  final double totalPrice;
  final String status;
  final DateTime deliveryDate;
  final DateTime bookDate;
  final int address;
  final String street;
  final String city;
  final String building;
  final String floor;
  final String apartment;
  final String buyerName;
  final String phoneNumber;
  final int buyerId;

  OrderModel({
    required this.idFromPaymob,
    required this.totalPrice,
    required this.status,
    required this.deliveryDate,
    required this.bookDate,
    required this.address,
    required this.street,
    required this.city,
    required this.building,
    required this.floor,
    required this.apartment,
    required this.buyerName,
    required this.phoneNumber,
    required this.buyerId,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      idFromPaymob: json['IDFromPaymob'] ?? 0,
      totalPrice: (json['Total_Price'] ?? 0).toDouble(),
      status: json['Status'] ?? "",
      deliveryDate: DateTime.parse(json['Delivery_Date'] ?? ""),
      bookDate: DateTime.parse(json['Book_Date'] ?? ""),
      address: json['Addess'] ?? 0,
      street: json['Street'] ?? "",
      city: json['City'] ?? "",
      building: json['Building'] ?? "",
      floor: json['Floor'] ?? "",
      apartment: json['Apartment'] ?? "",
      buyerName: json['Buyer_Name'] ?? "",
      phoneNumber: json['PhoneNumber'] ?? "",
      buyerId: json['Buyer_ID'] ?? 0,
    );
  }
}
