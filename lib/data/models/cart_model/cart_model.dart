class CartModel {
  final String itemID;
  final String itemName;
  final String imageCover;
  final double rate;
  final double priceOut;
  final double discount;
  final int quantity;
  final String categoryName;
  final String subCategoryName;

  CartModel({
    required this.itemID,
    required this.itemName,
    required this.imageCover,
    required this.rate,
    required this.priceOut,
    required this.discount,
    required this.quantity,
    required this.categoryName,
    required this.subCategoryName,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      itemID: json['Item_ID'],
      itemName: json['Item_Name'],
      imageCover: json['Image_Cover'],
      rate: (json['Rate'] ?? 0).toDouble(),
      priceOut: (json['Price_out'] ?? 0).toDouble(),
      discount: (json['Discount'] ?? 0).toDouble(),
      quantity: (json['Quantity'] ?? 0).toInt(),
      categoryName: json['Category_Name'],
      subCategoryName: json['Sub_Category_Name'],
    );
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Item_ID'] = itemID;
    map['Item_Name'] = itemName;
    map['Image_Cover'] = imageCover;
    map['Price_out'] = priceOut;
    map['Quantity'] = quantity;
    map['Discount'] = discount;
    map['Category_Name'] = categoryName;
    map['Sub_Category_Name'] = subCategoryName;
    return map;
  }
}
