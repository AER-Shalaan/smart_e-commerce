
import 'package:smart_ecommerce/data/models/home_models/produdts_model/products.dart';

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
        products?.add(Products.fromJson(v));
      });
    }
  }
  String? message;
  List<Products>? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
