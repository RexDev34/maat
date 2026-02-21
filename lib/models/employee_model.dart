import 'package:cloud_firestore/cloud_firestore.dart';

class EmployeeModel {
  final String id;
  final String firstName;
  final String lastName;

  final String role;
  final EmployeeContact contact;

  final List<String> assignedBranchIds;
  final EmployeePermissions permissions;

  final bool isActive;
  final Timestamp createdAt;
  final Timestamp updatedAt;

  EmployeeModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.contact,
    required this.assignedBranchIds,
    required this.permissions,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory EmployeeModel.fromMap(String id, Map<String, dynamic> map) {
    return EmployeeModel(
      id: id,
      firstName: map['firstName'],
      lastName: map['lastName'],
      role: map['role'],
      contact: EmployeeContact.fromMap(map['contact']),
      assignedBranchIds: List<String>.from(map['assignedBranchIds'] ?? []),
      permissions: EmployeePermissions.fromMap(map['permissions']),
      isActive: map['isActive'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  Map<String, dynamic> toMap() => {
    'firstName': firstName,
    'lastName': lastName,
    'role': role,
    'contact': contact.toMap(),
    'assignedBranchIds': assignedBranchIds,
    'permissions': permissions.toMap(),
    'isActive': isActive,
    'createdAt': createdAt,
    'updatedAt': updatedAt,
  };
}

class EmployeeContact {
  final String? email;
  final String? phone;

  EmployeeContact({this.email, this.phone});

  factory EmployeeContact.fromMap(Map<String, dynamic> map) {
    return EmployeeContact(email: map['email'], phone: map['phone']);
  }

  Map<String, dynamic> toMap() => {'email': email, 'phone': phone};
}

class EmployeePermissions {
  final bool canEditProducts;
  final bool canViewReports;
  final bool canRefund;

  EmployeePermissions({
    required this.canEditProducts,
    required this.canViewReports,
    required this.canRefund,
  });

  factory EmployeePermissions.fromMap(Map<String, dynamic> map) {
    return EmployeePermissions(
      canEditProducts: map['canEditProducts'] ?? false,
      canViewReports: map['canViewReports'] ?? false,
      canRefund: map['canRefund'] ?? false,
    );
  }

  Map<String, dynamic> toMap() => {
    'canEditProducts': canEditProducts,
    'canViewReports': canViewReports,
    'canRefund': canRefund,
  };
}
