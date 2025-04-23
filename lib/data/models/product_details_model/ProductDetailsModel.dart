import 'package:smart_ecommerce/data/models/home_models/produdts_model/products_data.dart';
import 'Brand.dart';
import 'Detilas.dart';
import 'Images.dart';

class ProductDetailsModel {
  ProductDetailsModel({this.data, this.images, this.brand, this.detilas});

  ProductDetailsModel.fromJson(dynamic json) {
    data = json['Data'] != null ? ProductsData.fromJson(json['Data']) : null;
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    brand = json['Brand'] != null ? Brand.fromJson(json['Brand']) : null;
    detilas =
        json['Detilas'] != null ? Detilas.fromJson(json['Detilas']) : null;
  }
  ProductsData? data;
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
