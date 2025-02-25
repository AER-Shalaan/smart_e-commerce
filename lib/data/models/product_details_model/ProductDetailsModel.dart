import 'Brand.dart';
import 'Data.dart';
import 'Detilas.dart';
import 'Images.dart';

class ProductDetailsModel {
  ProductDetailsModel({
    this.data,
    this.images,
    this.brand,
    this.detilas,
  });

  ProductDetailsModel.fromJson(dynamic json) {
    data = json['Data'] != null ? ProductData.fromJson(json['Data']) : null;
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    brand = json['Brand'] != null ? Brand.fromJson(json['Brand']) : null;
    detilas =
        json['Detilas'] != null ? Detilas.fromJson(json['Detilas']) : null;
  }
  ProductData? data;
  Images? images;
  Brand? brand;
  Detilas? detilas;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['Data'] = data?.toJson();
    }
    if (images != null) {
      map['images'] = images?.toJson();
    }
    if (brand != null) {
      map['Brand'] = brand?.toJson();
    }
    if (detilas != null) {
      map['Detilas'] = detilas?.toJson();
    }
    return map;
  }
}
