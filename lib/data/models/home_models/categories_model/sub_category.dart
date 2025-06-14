class SubCategory {
  SubCategory({
      this.subCategoryID, 
      this.subCategoryName, 
      this.subCategoryImage, 
      this.categoryID,});

  SubCategory.fromJson(dynamic json) {
    subCategoryID = json['Sub_Category_ID'];
    subCategoryName = json['Sub_Category_Name'];
    subCategoryImage = json['Sub_Category_Image'];
    categoryID = json['Category_ID'];
  }
  int? subCategoryID;
  String? subCategoryName;
  String? subCategoryImage;
  int? categoryID;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Sub_Category_ID'] = subCategoryID;
    map['Sub_Category_Name'] = subCategoryName;
    map['Sub_Category_Image'] = subCategoryImage;
    map['Category_ID'] = categoryID;
    return map;
  }

}