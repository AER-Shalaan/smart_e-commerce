class AdvNumbers {
  AdvNumbers({
      this.orderCount, 
      this.productCount, 
      this.totalSales,});

  AdvNumbers.fromJson(dynamic json) {
    orderCount = json['OrderCount'];
    productCount = json['ProductCount'];
    totalSales = json['TotalSales'];
  }
  String? orderCount;
  String? productCount;
  String? totalSales;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['OrderCount'] = orderCount;
    map['ProductCount'] = productCount;
    map['TotalSales'] = totalSales;
    return map;
  }

}