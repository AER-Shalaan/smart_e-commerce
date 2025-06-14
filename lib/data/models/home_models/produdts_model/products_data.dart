class ProductsData {
  ProductsData({
    this.itemID,
    this.imageCover,
    this.itemName,
    this.description,
    this.priceIn,
    this.priceOut,
    this.quantity,
    this.discount,
    this.rate,
    this.categoryName,
    this.subCategoryName,
    this.sellerName,
    this.viewCount,
    this.soldCount,
    this.crateDate,
    this.brandID,
  });

  ProductsData.fromJson(dynamic json) {
    itemID = json['Item_ID'];
    imageCover = json['Image_Cover'];
    itemName = json['Item_Name'];
    description = json['Description'];
    priceIn = json['Price_in'];
    priceOut = json['Price_out'];
    quantity = json['Quantity'];
    discount = json['Discount'];
    rate = json['Rate'];
    categoryName = json['Category_Name'];
    subCategoryName = json['Sub_Category_Name'];
    sellerName = json['seller_Name'];
    viewCount = json['View_Count'];
    soldCount = json['Sold_Count'];
    crateDate = json['Crate_Date'];
    brandID = json['Brand_ID'];
  }
  String? itemID;
  String? imageCover;
  String? itemName;
  String? description;
  num? priceIn;
  num? priceOut;
  num? quantity;
  num? discount;
  num? rate;
  String? categoryName;
  String? subCategoryName;
  String? sellerName;
  num? viewCount;
  num? soldCount;
  String? crateDate;
  dynamic brandID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Item_ID'] = itemID;
    map['Image_Cover'] = imageCover;
    map['Item_Name'] = itemName;
    map['Description'] = description;
    map['Price_in'] = priceIn;
    map['Price_out'] = priceOut;
    map['Quantity'] = quantity;
    map['Discount'] = discount;
    map['Rate'] = rate;
    map['Category_Name'] = categoryName;
    map['Sub_Category_Name'] = subCategoryName;
    map['seller_Name'] = sellerName;
    map['View_Count'] = viewCount;
    map['Sold_Count'] = soldCount;
    map['Crate_Date'] = crateDate;
    map['Brand_ID'] = brandID;
    return map;
  }
}
