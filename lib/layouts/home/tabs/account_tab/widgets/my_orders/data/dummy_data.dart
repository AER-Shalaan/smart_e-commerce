import '../models/order.dart';

final List<OrderModel> allOrders = [
  OrderModel(
    id: '123',
    items: ['T-shirt', 'Sneakers'],
    images: [
      'https://xcdn.next.co.uk/common/items/default/default/itemimages/3_4Ratio/product/lge/T26252s4.jpg?im=Resize,width=750',
      'https://i5.walmartimages.com/seo/Fashion-Running-Sneaker-for-Men-Shoes-Casual-Shoes-Leather-Sport-Shoes-Breathable-Comfortable-Walking-Shoes-Black-US11_dbb7aa5f-f2d8-447b-8498-865e5c80572c.654cd65ff1eb5be8ec30e259a1239c1d.jpeg',
    ],
    totalPrice: 99.99,
    date: '2025-02-14',
    address: '123 Main Street, New York',
    tracking: [
      OrderStatus(
        status: 'Packing',
        location: 'Warehouse, New York',
        timestamp: DateTime.parse("2025-02-15T10:30:00Z"),
      ),
      OrderStatus(
        status: 'Shipped',
        location: 'New York Distribution Center',
        timestamp: DateTime.parse("2025-02-16T08:00:00Z"),
      ),
      OrderStatus(
        status: 'In Transit',
        location: 'On the way',
        timestamp: DateTime.parse("2025-02-16T15:45:00Z"),
      ),
      OrderStatus(
        status: "Delivered",
        location: "925 S Chugach St #APT 10, Alaska",
        timestamp: DateTime.parse("2025-02-17T12:20:00Z"),
      ),
    ],
    currentStatusIndex: 2,
  ),
  OrderModel(
    id: '124',
    items: ['Watch'],
    images: ['https://m.media-amazon.com/images/I/61ZjlBOp+rL.jpg'],
    totalPrice: 199.99,
    date: '2025-02-10',
    address: '456 Elm Street, Los Angeles',
    tracking: [
      OrderStatus(
        status: 'Packing',
        location: 'Warehouse, Chicago',
        timestamp: DateTime.parse("2025-02-13T08:45:00Z"),
      ),
      OrderStatus(
        status: 'Shipped',
        location: 'Chicago Distribution Center',
        timestamp: DateTime.parse("2025-02-14T06:15:00Z"),
      ),
      OrderStatus(
        status: 'In Transit',
        location: 'On the way',
        timestamp: DateTime.parse("2025-02-15T13:30:00Z"),
      ),
      OrderStatus(
        status: "Delivered",
        location: "Near Delivery Address",
        timestamp: DateTime.parse("2025-02-16T09:00:00Z"),
      ),
    ],
    currentStatusIndex: 1,
  ),
  OrderModel(
    id: '125',
    items: ['Laptop'],
    images: ['https://m.media-amazon.com/images/I/61Y0buQFOkL.jpg'],
    totalPrice: 1299.99,
    date: '2025-02-12',
    address: '789 Oak Avenue, Chicago',
    tracking: [
      OrderStatus(
        status: 'Packing',
        location: 'Warehouse, Miami',
        timestamp: DateTime.parse("2025-02-12T10:10:00Z"),
      ),
      OrderStatus(
        status: 'Shipped',
        location: 'Miami Distribution Center',
        timestamp: DateTime.parse("2025-02-13T08:25:00Z"),
      ),
      OrderStatus(
        status: 'In Transit',
        location: 'On the way',
        timestamp: DateTime.parse("2025-02-14T15:50:00Z"),
      ),
      OrderStatus(
        status: "Delivered",
        location: "204 Ocean Dr, Miami Beach, FL",
        timestamp: DateTime.parse("2025-02-15T17:20:00Z"),
      ),
    ],
    currentStatusIndex: 3,
    rating: 4.5,
  ),
  OrderModel(
    id: '126',
    items: ['Headphones'],
    images: [
      'https://www.beatsbydre.com/content/dam/beats/web/product/headphones/studiopro-wireless/plp/drops/kk/plp-studiopro-kk-ecomm-moon.jpg.large.2x.jpg',
    ],
    totalPrice: 149.99,
    date: '2025-02-13',
    address: '321 Pine Street, Houston',
    tracking: [
      OrderStatus(
        status: 'Packing',
        location: 'Warehouse, Chicago',
        timestamp: DateTime.parse("2025-02-13T08:45:00Z"),
      ),
      OrderStatus(
        status: 'Shipped',
        location: 'Chicago Distribution Center',
        timestamp: DateTime.parse("2025-02-14T06:15:00Z"),
      ),
      OrderStatus(
        status: 'In Transit',
        location: 'On the way',
        timestamp: DateTime.parse("2025-02-15T13:30:00Z"),
      ),
      OrderStatus(
        status: "Delivered",
        location: "Near Delivery Address",
        timestamp: DateTime.parse("2025-02-16T09:00:00Z"),
      ),
    ],
    currentStatusIndex: 1,
  ),
  OrderModel(
    id: '127',
    items: ['Gaming Mouse', 'Mechanical Keyboard'],
    images: [
      'https://hardwaremarket.net/wp-content/uploads/2023/10/Redragon-M811-Aatrox-MMO-Gaming-Mouse-3.jpg',
      'https://www.prohavit.com/cdn/shop/files/KB874L_6_cbf8aa60-d1a9-46b9-b5d1-7e0e30fc1407.jpg?v=1716382447',
    ],
    totalPrice: 179.99,
    date: '2025-02-11',
    address: '654 Maple Road, San Francisco',
    tracking: [
      OrderStatus(
        status: 'Packing',
        location: 'Warehouse, Miami',
        timestamp: DateTime.parse("2025-02-12T10:10:00Z"),
      ),
      OrderStatus(
        status: 'Shipped',
        location: 'Miami Distribution Center',
        timestamp: DateTime.parse("2025-02-13T08:25:00Z"),
      ),
      OrderStatus(
        status: 'In Transit',
        location: 'On the way',
        timestamp: DateTime.parse("2025-02-14T15:50:00Z"),
      ),
      OrderStatus(
        status: "Delivered",
        location: "204 Ocean Dr, Miami Beach, FL",
        timestamp: DateTime.parse("2025-02-15T17:20:00Z"),
      ),
    ],
    currentStatusIndex: 3,
  ),
];
