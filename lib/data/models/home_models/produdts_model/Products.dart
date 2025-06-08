import 'products_data.dart';

class Products {
  Products({this.data, this.images, this.brand});

  Products.fromJson(dynamic json) {
    data = json['Data'] != null ? ProductsData.fromJson(json['Data']) : null;
    images = json['images'];
    brand = json['Brand'];
  }
  ProductsData? data;
  dynamic images;
  dynamic brand;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['Data'] = data?.toJson();
    }
    map['images'] = images;
    map['Brand'] = brand;
    return map;
  }
}
