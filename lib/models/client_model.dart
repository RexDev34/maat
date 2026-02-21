import 'package:cloud_firestore/cloud_firestore.dart';

class ClientModel {
  final String id;
  final String firstName;
  final String? lastName;

  final ClientContact contact;
  final ClientMetrics metrics;

  final List<String>? tags;

  final bool isActive;
  final Timestamp createdAt;
  final Timestamp updatedAt;

  ClientModel({
    required this.id,
    required this.firstName,
    this.lastName,
    required this.contact,
    required this.metrics,
    this.tags,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ClientModel.fromMap(String id, Map<String, dynamic> map) {
    return ClientModel(
      id: id,
      firstName: map['firstName'],
      lastName: map['lastName'],
      contact: ClientContact.fromMap(map['contact']),
      metrics: ClientMetrics.fromMap(map['metrics']),
      tags: map['tags'] != null ? List<String>.from(map['tags']) : null,
      isActive: map['isActive'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  Map<String, dynamic> toMap() => {
    'firstName': firstName,
    'lastName': lastName,
    'contact': contact.toMap(),
    'metrics': metrics.toMap(),
    'tags': tags,
    'isActive': isActive,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };
}

class ClientContact {
  final String? phone;
  final String? email;

  ClientContact({this.phone, this.email});

  factory ClientContact.fromMap(Map<String, dynamic> map) {
    return ClientContact(phone: map['phone'], email: map['email']);
  }

  Map<String, dynamic> toMap() => {'phone': phone, 'email': email};
}

class ClientMetrics {
  final int totalPurchases;
  final double totalSpent;
  final Timestamp? lastPurchaseAt;

  ClientMetrics({
    required this.totalPurchases,
    required this.totalSpent,
    this.lastPurchaseAt,
  });

  factory ClientMetrics.fromMap(Map<String, dynamic> map) {
    return ClientMetrics(
      totalPurchases: map['totalPurchases'] ?? 0,
      totalSpent: (map['totalSpent'] ?? 0).toDouble(),
      lastPurchaseAt: map['lastPurchaseAt'],
    );
  }

  Map<String, dynamic> toMap() => {
    'totalPurchases': totalPurchases,
    'totalSpent': totalSpent,
    'lastPurchaseAt': lastPurchaseAt,
  };
}
