import 'package:cloud_firestore/cloud_firestore.dart';

class OwnerModel {
  final String uid;
  final String email;
  final String displayName;
  final String? phone;
  final String? photoUrl;

  final String role;
  final Subscription subscription;
  final OwnerSettings settings;
  final OwnerMetrics metrics;

  final bool isActive;
  final Timestamp createdAt;
  final Timestamp updatedAt;

  OwnerModel({
    required this.uid,
    required this.email,
    required this.displayName,
    this.phone,
    this.photoUrl,
    required this.role,
    required this.subscription,
    required this.settings,
    required this.metrics,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OwnerModel.fromMap(String uid, Map<String, dynamic> map) {
    return OwnerModel(
      uid: uid,
      email: map['email'],
      displayName: map['displayName'],
      phone: map['phone'],
      photoUrl: map['photoUrl'],
      role: map['role'],
      subscription: Subscription.fromMap(map['subscription']),
      settings: OwnerSettings.fromMap(map['settings']),
      metrics: OwnerMetrics.fromMap(map['metrics']),
      isActive: map['isActive'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  Map<String, dynamic> toMap() => {
    'email': email,
    'displayName': displayName,
    'phone': phone,
    'photoUrl': photoUrl,
    'role': role,
    'subscription': subscription.toMap(),
    'settings': settings.toMap(),
    'metrics': metrics.toMap(),
    'isActive': isActive,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };
}

class Subscription {
  final String plan;
  final String status;
  final Timestamp? trialEndsAt;
  final Timestamp? currentPeriodEnd;

  Subscription({
    required this.plan,
    required this.status,
    this.trialEndsAt,
    this.currentPeriodEnd,
  });

  factory Subscription.fromMap(Map<String, dynamic> map) {
    return Subscription(
      plan: map['plan'],
      status: map['status'],
      trialEndsAt: map['trialEndsAt'],
      currentPeriodEnd: map['currentPeriodEnd'],
    );
  }

  Map<String, dynamic> toMap() => {
    'plan': plan,
    'status': status,
    'trialEndsAt': trialEndsAt,
    'currentPeriodEnd': currentPeriodEnd,
  };
}

class OwnerSettings {
  final String language;
  final String currency;
  final String timezone;

  OwnerSettings({
    required this.language,
    required this.currency,
    required this.timezone,
  });

  factory OwnerSettings.fromMap(Map<String, dynamic> map) {
    return OwnerSettings(
      language: map['language'],
      currency: map['currency'],
      timezone: map['timezone'],
    );
  }

  Map<String, dynamic> toMap() => {
    'language': language,
    'currency': currency,
    'timezone': timezone,
  };
}

class OwnerMetrics {
  final int totalBusinesses;
  final double totalRevenue;

  OwnerMetrics({required this.totalBusinesses, required this.totalRevenue});

  factory OwnerMetrics.fromMap(Map<String, dynamic> map) {
    return OwnerMetrics(
      totalBusinesses: map['totalBusinesses'] ?? 0,
      totalRevenue: (map['totalRevenue'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toMap() => {
    'totalBusinesses': totalBusinesses,
    'totalRevenue': totalRevenue,
  };
}
