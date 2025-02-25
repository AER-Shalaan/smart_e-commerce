class OrderModel {
  final String id;
  final List<String> items;
  final List<String> images;
  final double totalPrice;
  final List<OrderStatus> tracking;
  final int currentStatusIndex; // لمعرفة المرحلة الحالية
  final String date;
  final String address;
  final double? rating;

  OrderModel({
    required this.id,
    required this.items,
    required this.images,
    required this.totalPrice,
    required this.tracking,
    required this.currentStatusIndex,
    required this.date,
    required this.address,
    this.rating = 0,
  });

  OrderStatus get currentStatus => tracking[currentStatusIndex];
}

class OrderStatus {
  final String status;
  final String location;
  final DateTime timestamp;

  OrderStatus({
    required this.status,
    required this.location,
    required this.timestamp,
  });
}
