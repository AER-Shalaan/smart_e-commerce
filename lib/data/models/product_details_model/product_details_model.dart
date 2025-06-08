import 'package:smart_ecommerce/data/models/home_models/produdts_model/products_data.dart';
import 'brand.dart';
import 'images.dart';

class ProductDetailsModel {
  final ProductsData? data;
  final Images? images;
  final Brand? brand;
  final Map<String, dynamic>? details;
  ProductDetailsModel({this.data, this.images, this.brand, this.details});

   factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      data: json['Data'] != null
          ? ProductsData.fromJson(json['Data'] as Map<String, dynamic>)
          : null,
      images: json['images'] != null
          ? Images.fromJson(json['images'] as Map<String, dynamic>)
          : null,
      brand: json['Brand'] != null
          ? Brand.fromJson(json['Brand'] as Map<String, dynamic>)
          : null,
      details: json['Detilas'] != null
          ? Map<String, dynamic>.from(json['Detilas'] as Map<String, dynamic>)
          : null,
    );
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['Data'] = data!.toJson();
    }
    if (images != null) {
      map['images'] = images!.toJson();
    }
    if (brand != null) {
      map['Brand'] = brand!.toJson();
    }
    if (details != null) {
      map['Detilas'] = details;
    }
    return map;
  }
}
