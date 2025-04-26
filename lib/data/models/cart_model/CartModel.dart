class CartModel {
  CartModel({
    this.itemID,
    this.itemName,
    this.imageCover,
    this.priceOut,
    this.quantity,
    this.categoryName,
    this.subCategoryName,
  });

  CartModel.fromJson(dynamic json) {
    itemID = json['Item_ID'];
    itemName = json['Item_Name'];
    imageCover = json['Image_Cover'];
    priceOut = json['Price_out'];
    quantity = json['Quantity'];
    categoryName = json['Category_Name'];
    subCategoryName = json['Sub_Category_Name'];
  }
  String? itemID;
  String? itemName;
  String? imageCover;
  num? priceOut;
  num? quantity;
  String? categoryName;
  String? subCategoryName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Item_ID'] = itemID;
    map['Item_Name'] = itemName;
    map['Image_Cover'] = imageCover;
    map['Price_out'] = priceOut;
    map['Quantity'] = quantity;
    map['Category_Name'] = categoryName;
    map['Sub_Category_Name'] = subCategoryName;
    return map;
  }
}
