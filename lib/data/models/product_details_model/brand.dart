class Brand {
  Brand({this.brandID, this.brandName, this.brandImage});

  Brand.fromJson(dynamic json) {
    brandID = json['Brand_ID'];
    brandName = json['Brand_Name'];
    brandImage = json['Brand_Image'];
  }
  String? brandID;
  String? brandName;
  String? brandImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Brand_ID'] = brandID;
    map['Brand_Name'] = brandName;
    map['Brand_Image'] = brandImage;
    return map;
  }
}
