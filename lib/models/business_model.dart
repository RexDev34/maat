import 'package:cloud_firestore/cloud_firestore.dart';

class BusinessModel {
  final String id;
  final String name;
  final String category;
  final String businessType;

  final String currency;
  final String country;

  final BusinessMetrics metrics;

  final bool isActive;
  final Timestamp createdAt;
  final Timestamp updatedAt;

  BusinessModel({
    required this.id,
    required this.name,
    required this.category,
    required this.businessType,
    required this.currency,
    required this.country,
    required this.metrics,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BusinessModel.fromMap(String id, Map<String, dynamic> map) {
    return BusinessModel(
      id: id,
      name: map['name'],
      category: map['category'],
      businessType: map['businessType'],
      currency: map['currency'],
      country: map['country'],
      metrics: BusinessMetrics.fromMap(map['metrics']),
      isActive: map['isActive'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  Map<String, dynamic> toMap() => {
    'name': name,
    'category': category,
    'businessType': businessType,
    'currency': currency,
    'country': country,
    'metrics': metrics.toMap(),
    'isActive': isActive,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };
}

class BusinessMetrics {
  final int totalBranches;
  final int totalProducts;
  final int totalClients;
  final double totalSales;

  BusinessMetrics({
    required this.totalBranches,
    required this.totalProducts,
    required this.totalClients,
    required this.totalSales,
  });

  factory BusinessMetrics.fromMap(Map<String, dynamic> map) {
    return BusinessMetrics(
      totalBranches: map['totalBranches'] ?? 0,
      totalProducts: map['totalProducts'] ?? 0,
      totalClients: map['totalClients'] ?? 0,
      totalSales: (map['totalSales'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toMap() => {
    'totalBranches': totalBranches,
    'totalProducts': totalProducts,
    'totalClients': totalClients,
    'totalSales': totalSales,
  };
}
