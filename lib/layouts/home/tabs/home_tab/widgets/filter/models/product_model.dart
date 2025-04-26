class Product {
  final int id;
  final String name;
  final String subcategoryId;
  final double price;
  final double rating;
  final Map<String, dynamic> features;

  Product({
    required this.id,
    required this.name,
    required this.subcategoryId,
    required this.price,
    required this.rating,
    required this.features,
  });

  List<Product> dummyProducts = [
    Product(
      id: 1,
      name: 'Samsung Galaxy S23',
      subcategoryId: '1',
      price: 5000.0,
      rating: 4.5,
      features: {'RAM': '8GB', 'Storage': '256GB', 'Color': 'Black'},
    ),
    Product(
      id: 2,
      name: 'MacBook Pro M2',
      subcategoryId: '2',
      price: 15000.0,
      rating: 4.8,
      features: {'CPU': 'M2', 'RAM': '16GB', 'Storage': '512GB'},
    ),
    Product(
      id: 3,
      name: 'قميص كاجوال',
      subcategoryId: '3',
      price: 250.0,
      rating: 4.2,
      features: {'Size': 'L', 'Color': 'Blue', 'Material': 'Cotton'},
    ),
    Product(
      id: 4,
      name: 'iPhone 14',
      subcategoryId: '1',
      price: 12000.0,
      rating: 4.7,
      features: {'RAM': '6GB', 'Storage': '128GB', 'Color': 'Silver'},
    ),
    Product(
      id: 5,
      name: 'Dell XPS 13',
      subcategoryId: '2',
      price: 13000.0,
      rating: 4.6,
      features: {'CPU': 'Intel i7', 'RAM': '16GB', 'Storage': '512GB'},
    ),
    Product(
      id: 6,
      name: 'قميص رياضي',
      subcategoryId: '3',
      price: 150.0,
      rating: 4.3,
      features: {'Size': 'M', 'Color': 'Red', 'Material': 'Polyester'},
    ),
    Product(
      id: 7,
      name: 'Sony WH-1000XM5',
      subcategoryId: '4',
      price: 4000.0,
      rating: 4.9,
      features: {
        'Type': 'Over-ear',
        'Color': 'Black',
        'Noise Cancellation': 'Yes',
      },
    ),
    Product(
      id: 8,
      name: 'JBL Flip 5',
      subcategoryId: '4',
      price: 1200.0,
      rating: 4.5,
      features: {'Type': 'Portable', 'Color': 'Blue', 'Waterproof': 'Yes'},
    ),
    Product(
      id: 9,
      name: 'Socks Pack (3 Pairs)',
      subcategoryId: '5',
      price: 120.0,
      rating: 4.4,
      features: {'Size': 'M', 'Color': 'Black', 'Material': 'Cotton'},
    ),
    Product(
      id: 10,
      name: 'Luxury Couch',
      subcategoryId: '6',
      price: 8000.0,
      rating: 4.8,
      features: {'Material': 'Leather', 'Color': 'Brown', 'Size': 'Large'},
    ),
    Product(
      id: 11,
      name: 'King Size Bed',
      subcategoryId: '7',
      price: 10000.0,
      rating: 4.7,
      features: {'Material': 'Wood', 'Color': 'White', 'Size': 'King'},
    ),
  ];
}
