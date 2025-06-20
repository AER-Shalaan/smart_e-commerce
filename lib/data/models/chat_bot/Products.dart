import 'package:smart_ecommerce/data/models/chat_bot/Data.dart';
import 'package:smart_ecommerce/data/models/product_details_model/brand.dart';

import 'Rating.dart';

class Products {
  Products({
      this.brand, 
      this.data, 
      this.detilas, 
      this.rating, 
      this.images,});

  Products.fromJson(dynamic json) {
    brand = json['Brand'] != null ? Brand.fromJson(json['Brand']) : null;
    data = json['Data'] != null ? Data.fromJson(json['Data']) : null;
    detilas = json['Detilas'];
    rating = json['Rating'] != null ? Rating.fromJson(json['Rating']) : null;
    images = json['images'];
  }
  Brand? brand;
  Data? data;
  dynamic detilas;
  Rating? rating;
  dynamic images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (brand != null) {
      map['Brand'] = brand?.toJson();
    }
    if (data != null) {
      map['Data'] = data?.toJson();
    }
    map['Detilas'] = detilas;
    if (rating != null) {
      map['Rating'] = rating?.toJson();
    }
    map['images'] = images;
    return map;
  }

}