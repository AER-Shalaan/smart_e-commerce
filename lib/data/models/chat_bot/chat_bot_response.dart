import 'package:smart_ecommerce/data/models/product_details_model/product_details_model.dart';


class ChatBotResponse {
  ChatBotResponse({
      this.message, 
      this.pageNumber, 
      this.pageSize, 
      this.products, 
      this.reply, 
      this.totalItems, 
      this.totalPages,});

  ChatBotResponse.fromJson(dynamic json) {
    message = json['message'];
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(ProductDetailsModel.fromJson(v));
      });
    }
    reply = json['reply'];
    totalItems = json['totalItems'];
    totalPages = json['totalPages'];
  }
  String? message;
  num? pageNumber;
  num? pageSize;
  List<ProductDetailsModel>? products;
  String? reply;
  num? totalItems;
  num? totalPages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['pageNumber'] = pageNumber;
    map['pageSize'] = pageSize;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    map['reply'] = reply;
    map['totalItems'] = totalItems;
    map['totalPages'] = totalPages;
    return map;
  }

}