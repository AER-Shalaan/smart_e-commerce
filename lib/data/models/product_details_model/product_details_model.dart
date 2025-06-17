import 'package:smart_ecommerce/data/models/product_details_model/products_data.dart';
import 'package:smart_ecommerce/data/models/product_details_model/rating.dart';

import 'brand.dart';
import 'images.dart';

class ProductDetailsModel {
  final ProductsData? data;
  final Images? images;
  final Brand? brand;
  final Rating? rating;
  final Map<String, dynamic>? details;
  ProductDetailsModel({this.data, this.images, this.brand, this.details, this.rating});

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
      rating: json['Rating'] != null
          ? Rating.fromJson(json['Rating'] as Map<String, dynamic>)
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
    if (rating != null) {
      map['Rating'] = rating!.toJson();
    }
    return map;
  }
}
