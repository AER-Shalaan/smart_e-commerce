class Category {
  Category({
      this.categoryID, 
      this.categoryName, 
      this.categoryImage,});

  Category.fromJson(dynamic json) {
    categoryID = json['Category_ID'];
    categoryName = json['Category_Name'];
    categoryImage = json['Category_Image'];
  }
  int? categoryID;
  String? categoryName;
  String? categoryImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Category_ID'] = categoryID;
    map['Category_Name'] = categoryName;
    map['Category_Image'] = categoryImage;
    return map;
  }

}