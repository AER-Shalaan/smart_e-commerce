
import 'package:smart_ecommerce/data/models/product_details_model/product_details_model.dart';

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
        products?.add(ProductDetailsModel.fromJson(v));
      });
    }
  }
  String? message;
  num? pageNumber;
  num? pageSize;
  num? totalPages;
  num? totalItems;
  List<ProductDetailsModel>? products;

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
