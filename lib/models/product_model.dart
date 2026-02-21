import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id;
  final String name;
  final String? description;
  final String type;

  final Pricing pricing;
  final Inventory inventory;

  final String? sku;
  final String? barcode;

  final ProductMetrics metrics;

  final bool isActive;
  final Timestamp createdAt;
  final Timestamp updatedAt;

  ProductModel({
    required this.id,
    required this.name,
    this.description,
    required this.type,
    required this.pricing,
    required this.inventory,
    this.sku,
    this.barcode,
    required this.metrics,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ProductModel.fromMap(String id, Map<String, dynamic> map) {
    return ProductModel(
      id: id,
      name: map['name'],
      description: map['description'],
      type: map['type'],
      pricing: Pricing.fromMap(map['pricing']),
      inventory: Inventory.fromMap(map['inventory']),
      sku: map['sku'],
      barcode: map['barcode'],
      metrics: ProductMetrics.fromMap(map['metrics']),
      isActive: map['isActive'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  Map<String, dynamic> toMap() => {
    'name': name,
    'description': description,
    'type': type,
    'pricing': pricing.toMap(),
    'inventory': inventory.toMap(),
    'sku': sku,
    'barcode': barcode,
    'metrics': metrics.toMap(),
    'isActive': isActive,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };
}

class Pricing {
  final double cost;
  final double price;
  final double? margin;

  Pricing({required this.cost, required this.price, this.margin});

  factory Pricing.fromMap(Map<String, dynamic> map) {
    return Pricing(
      cost: (map['cost'] ?? 0).toDouble(),
      price: (map['price'] ?? 0).toDouble(),
      margin: map['margin']?.toDouble(),
    );
  }

  Map<String, dynamic> toMap() => {
    'cost': cost,
    'price': price,
    'margin': margin,
  };
}

class Inventory {
  final bool trackStock;
  final int stock;
  final int minStock;

  Inventory({
    required this.trackStock,
    required this.stock,
    required this.minStock,
  });

  factory Inventory.fromMap(Map<String, dynamic> map) {
    return Inventory(
      trackStock: map['trackStock'] ?? false,
      stock: map['stock'] ?? 0,
      minStock: map['minStock'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() => {
    'trackStock': trackStock,
    'stock': stock,
    'minStock': minStock,
  };
}

class ProductMetrics {
  final int totalSold;
  final double totalRevenue;

  ProductMetrics({required this.totalSold, required this.totalRevenue});

  factory ProductMetrics.fromMap(Map<String, dynamic> map) {
    return ProductMetrics(
      totalSold: map['totalSold'] ?? 0,
      totalRevenue: (map['totalRevenue'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toMap() => {
    'totalSold': totalSold,
    'totalRevenue': totalRevenue,
  };
}
