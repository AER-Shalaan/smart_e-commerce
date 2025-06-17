

import 'package:smart_ecommerce/data/models/product_details_model/product_details_model.dart';

class RecommendedProductsModel {
  RecommendedProductsModel({
    this.message,
    this.products,
  });

  RecommendedProductsModel.fromJson(dynamic json) {
    message = json['message'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(ProductDetailsModel.fromJson(v));
      });
    }
  }
  String? message;
  List<ProductDetailsModel>? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
