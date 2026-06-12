class Data {
  Data({
      this.brandID, 
      this.categoryID, 
      this.crateDate, 
      this.description, 
      this.discount, 
      this.imageCover, 
      this.itemID, 
      this.itemName, 
      this.priceIn, 
      this.priceOut, 
      this.quantity, 
      this.rate, 
      this.sellerID, 
      this.softDelete, 
      this.soldCount, 
      this.subCategoryID, 
      this.viewCount,});

  Data.fromJson(dynamic json) {
    brandID = json['Brand_ID'];
    categoryID = json['Category_ID'];
    crateDate = json['Crate_Date'];
    description = json['Description'];
    discount = json['Discount'];
    imageCover = json['Image_Cover'];
    itemID = json['Item_ID'];
    itemName = json['Item_Name'];
    priceIn = json['Price_in'];
    priceOut = json['Price_out'];
    quantity = json['Quantity'];
    rate = json['Rate'];
    sellerID = json['Seller_ID'];
    softDelete = json['SoftDelete'];
    soldCount = json['Sold_Count'];
    subCategoryID = json['Sub_Category_ID'];
    viewCount = json['View_Count'];
  }
  num? brandID;
  num? categoryID;
  String? crateDate;
  String? description;
  num? discount;
  String? imageCover;
  String? itemID;
  String? itemName;
  num? priceIn;
  num? priceOut;
  num? quantity;
  num? rate;
  num? sellerID;
  bool? softDelete;
  num? soldCount;
  num? subCategoryID;
  num? viewCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Brand_ID'] = brandID;
    map['Category_ID'] = categoryID;
    map['Crate_Date'] = crateDate;
    map['Description'] = description;
    map['Discount'] = discount;
    map['Image_Cover'] = imageCover;
    map['Item_ID'] = itemID;
    map['Item_Name'] = itemName;
    map['Price_in'] = priceIn;
    map['Price_out'] = priceOut;
    map['Quantity'] = quantity;
    map['Rate'] = rate;
    map['Seller_ID'] = sellerID;
    map['SoftDelete'] = softDelete;
    map['Sold_Count'] = soldCount;
    map['Sub_Category_ID'] = subCategoryID;
    map['View_Count'] = viewCount;
    return map;
  }

}