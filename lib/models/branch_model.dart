import 'package:cloud_firestore/cloud_firestore.dart';

class BranchModel {
  final String id;
  final String name;

  final BranchLocation location;
  final BranchContact contact;

  final Map<String, OperatingHours>? operatingHours;

  final bool isActive;
  final Timestamp createdAt;
  final Timestamp updatedAt;

  BranchModel({
    required this.id,
    required this.name,
    required this.location,
    required this.contact,
    this.operatingHours,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BranchModel.fromMap(String id, Map<String, dynamic> map) {
    return BranchModel(
      id: id,
      name: map['name'],
      location: BranchLocation.fromMap(map['location']),
      contact: BranchContact.fromMap(map['contact']),
      operatingHours: map['operatingHours'] != null
          ? (map['operatingHours'] as Map<String, dynamic>).map(
              (key, value) => MapEntry(key, OperatingHours.fromMap(value)),
            )
          : null,
      isActive: map['isActive'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  Map<String, dynamic> toMap() => {
    'name': name,
    'location': location.toMap(),
    'contact': contact.toMap(),
    'operatingHours': operatingHours?.map(
      (key, value) => MapEntry(key, value.toMap()),
    ),
    'isActive': isActive,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };
}

class BranchLocation {
  final String address;
  final String city;
  final String state;
  final String? zipCode;
  final GeoPoint? geoPoint;

  BranchLocation({
    required this.address,
    required this.city,
    required this.state,
    this.zipCode,
    this.geoPoint,
  });

  factory BranchLocation.fromMap(Map<String, dynamic> map) {
    return BranchLocation(
      address: map['address'],
      city: map['city'],
      state: map['state'],
      zipCode: map['zipCode'],
      geoPoint: map['geoPoint'],
    );
  }

  Map<String, dynamic> toMap() => {
    'address': address,
    'city': city,
    'state': state,
    'zipCode': zipCode,
    'geoPoint': geoPoint,
  };
}

class BranchContact {
  final String? phone;
  final String? email;

  BranchContact({this.phone, this.email});

  factory BranchContact.fromMap(Map<String, dynamic> map) {
    return BranchContact(phone: map['phone'], email: map['email']);
  }

  Map<String, dynamic> toMap() => {'phone': phone, 'email': email};
}

class OperatingHours {
  final String open;
  final String close;

  OperatingHours({required this.open, required this.close});

  factory OperatingHours.fromMap(Map<String, dynamic> map) {
    return OperatingHours(open: map['open'], close: map['close']);
  }

  Map<String, dynamic> toMap() => {'open': open, 'close': close};
}
