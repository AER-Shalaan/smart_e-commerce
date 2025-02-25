class TopRatedModel {
  TopRatedModel({
      this.itemID, 
      this.imageCover, 
      this.itemName, 
      this.description, 
      this.quantity, 
      this.priceOut, 
      this.discount, 
      this.rate,});

  TopRatedModel.fromJson(dynamic json) {
    itemID = json['Item_ID'];
    imageCover = json['Image_Cover'];
    itemName = json['Item_Name'];
    description = json['Description'];
    quantity = json['Quantity'];
    priceOut = json['Price_out'];
    discount = json['Discount'];
    rate = json['Rate'];
  }
  String? itemID;
  String? imageCover;
  String? itemName;
  String? description;
  num? quantity;
  num? priceOut;
  num? discount;
  num? rate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Item_ID'] = itemID;
    map['Image_Cover'] = imageCover;
    map['Item_Name'] = itemName;
    map['Description'] = description;
    map['Quantity'] = quantity;
    map['Price_out'] = priceOut;
    map['Discount'] = discount;
    map['Rate'] = rate;
    return map;
  }

}