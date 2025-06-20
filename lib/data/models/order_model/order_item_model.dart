class OrderItemModel {
  final int orderId;
  final String itemId;
  final int quantity;
  final double priceOut;
  final double discount;
  final String itemName;
  final double rate;
  final String imageCover;
  final String categoryImage;
  final String subCategoryName;

  OrderItemModel({
    required this.orderId,
    required this.itemId,
    required this.quantity,
    required this.priceOut,
    required this.discount,
    required this.itemName,
    required this.rate,
    required this.imageCover,
    required this.categoryImage,
    required this.subCategoryName,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      orderId: json['Order_ID'] as int,
      itemId: json['Item_ID'] as String,
      quantity: json['Quantity'] as int,
      priceOut: (json['Price_out'] as num).toDouble(),
      discount: (json['Discount'] as num).toDouble(),
      itemName: json['Item_Name'] as String,
      rate: (json['Rate'] as num).toDouble(),
      imageCover: json['Image_Cover'] as String,
      categoryImage: json['Category_Image'] as String,
      subCategoryName: json['Sub_Category_Name'] as String,
    );
  }
}
