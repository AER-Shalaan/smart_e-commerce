import 'package:smart_ecommerce/data/models/home_models/produdts_model/products.dart';

class ProductsModel {
  ProductsModel({
    this.message,
    this.pageNumber,
    this.pageSize,
    this.totalPages,
    this.totalItems,
    this.products,
  });

  ProductsModel.fromJson(dynamic json) {
    message = json['message'];
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    totalPages = json['totalPages'];
    totalItems = json['totalItems'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
  }
  String? message;
  num? pageNumber;
  num? pageSize;
  num? totalPages;
  num? totalItems;
  List<Products>? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['pageNumber'] = pageNumber;
    map['pageSize'] = pageSize;
    map['totalPages'] = totalPages;
    map['totalItems'] = totalItems;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
