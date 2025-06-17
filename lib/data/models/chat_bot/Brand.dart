class Brand {
  Brand({
      this.brandID, 
      this.brandImage, 
      this.brandName,});

  Brand.fromJson(dynamic json) {
    brandID = json['Brand_ID'];
    brandImage = json['Brand_Image'];
    brandName = json['Brand_Name'];
  }
  String? brandID;
  String? brandImage;
  String? brandName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Brand_ID'] = brandID;
    map['Brand_Image'] = brandImage;
    map['Brand_Name'] = brandName;
    return map;
  }

}