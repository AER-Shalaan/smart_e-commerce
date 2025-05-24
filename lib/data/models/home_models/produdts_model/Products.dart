import 'products_data.dart';
import 'detilas.dart';

class Products {
  Products({
      this.data, 
      this.images, 
      this.brand, 
      this.detilas,});

  Products.fromJson(dynamic json) {
    data = json['Data'] != null ? ProductsData.fromJson(json['Data']) : null;
    images = json['images'];
    brand = json['Brand'];
    detilas = json['Detilas'] != null ? Detilas.fromJson(json['Detilas']) : null;
  }
  ProductsData? data;
  dynamic images;
  dynamic brand;
  Detilas? detilas;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['Data'] = data?.toJson();
    }
    map['images'] = images;
    map['Brand'] = brand;
    if (detilas != null) {
      map['Detilas'] = detilas?.toJson();
    }
    return map;
  }

}