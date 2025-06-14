class WishlistItemModel {
  final String itemId;
  final String imageCover;
  final String itemName;
  final double priceOut;
  final double discount;
  final String categoryName;
  final String subCategoryName;

  WishlistItemModel({
    required this.itemId,
    required this.imageCover,
    required this.itemName,
    required this.priceOut,
    required this.discount,
    required this.categoryName,
    required this.subCategoryName,
  });

  factory WishlistItemModel.fromJson(Map<String, dynamic> json) {
    return WishlistItemModel(
      itemId: json['Item_ID'] ?? '',
      imageCover: json['Image_Cover'] ?? '',
      itemName: json['Item_Name'] ?? '',
      priceOut: (json['Price_out'] ?? 0).toDouble(),
      discount: (json['Discount'] ?? 0).toDouble(),
      categoryName: json['Category_Name'] ?? '',
      subCategoryName: json['Sub_Category_Name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Item_ID': itemId,
      'Image_Cover': imageCover,
      'Item_Name': itemName,
      'Price_out': priceOut,
      'Category_Name': categoryName,
      'Sub_Category_Name': subCategoryName,
    };
  }
}
