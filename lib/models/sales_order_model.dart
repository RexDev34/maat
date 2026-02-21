import 'package:cloud_firestore/cloud_firestore.dart';

/// ===============================
/// ENUMS
/// ===============================

enum SalesOrderStatus { draft, confirmed, completed, cancelled, refunded }

enum PaymentMethod { cash, card, transfer, mixed }

enum OrderType { dineIn, takeAway, delivery }

/// ===============================
/// SALES ORDER ITEM
/// ===============================

class SalesOrderItemModel {
  final String productId;
  final String productName;
  final double unitPrice;
  final int quantity;
  final double total;
  final Map<String, dynamic>? modifiers;

  SalesOrderItemModel({
    required this.productId,
    required this.productName,
    required this.unitPrice,
    required this.quantity,
    required this.total,
    this.modifiers,
  });

  factory SalesOrderItemModel.fromMap(Map<String, dynamic> map) {
    return SalesOrderItemModel(
      productId: map['productId'],
      productName: map['productName'],
      unitPrice: (map['unitPrice'] as num).toDouble(),
      quantity: map['quantity'],
      total: (map['total'] as num).toDouble(),
      modifiers: map['modifiers'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'productName': productName,
      'unitPrice': unitPrice,
      'quantity': quantity,
      'total': total,
      'modifiers': modifiers,
    };
  }
}

/// ===============================
/// SALES ORDER PAYMENT
/// ===============================

class SalesOrderPaymentModel {
  final PaymentMethod method;
  final double amount;
  final Timestamp paidAt;

  SalesOrderPaymentModel({
    required this.method,
    required this.amount,
    required this.paidAt,
  });

  factory SalesOrderPaymentModel.fromMap(Map<String, dynamic> map) {
    return SalesOrderPaymentModel(
      method: PaymentMethod.values.byName(map['method']),
      amount: (map['amount'] as num).toDouble(),
      paidAt: map['paidAt'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'method': method.name, 'amount': amount, 'paidAt': paidAt};
  }
}

/// ===============================
/// SALES ORDER MODEL
/// ===============================

class SalesOrderModel {
  final String id;
  final String branchId;
  final String? clientId;
  final String employeeId;

  final OrderType orderType;
  final SalesOrderStatus status;

  final List<SalesOrderItemModel> items;
  final List<SalesOrderPaymentModel> payments;

  final double subtotal;
  final double tax;
  final double discount;
  final double total;

  final String? notes;

  final Timestamp createdAt;
  final Timestamp updatedAt;

  SalesOrderModel({
    required this.id,
    required this.branchId,
    this.clientId,
    required this.employeeId,
    required this.orderType,
    required this.status,
    required this.items,
    required this.payments,
    required this.subtotal,
    required this.tax,
    required this.discount,
    required this.total,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  /// ===============================
  /// FROM MAP
  /// ===============================

  factory SalesOrderModel.fromMap(Map<String, dynamic> map, String documentId) {
    return SalesOrderModel(
      id: documentId,
      branchId: map['branchId'],
      clientId: map['clientId'],
      employeeId: map['employeeId'],
      orderType: OrderType.values.byName(map['orderType']),
      status: SalesOrderStatus.values.byName(map['status']),
      items: (map['items'] as List)
          .map((e) => SalesOrderItemModel.fromMap(e))
          .toList(),
      payments: (map['payments'] as List)
          .map((e) => SalesOrderPaymentModel.fromMap(e))
          .toList(),
      subtotal: (map['subtotal'] as num).toDouble(),
      tax: (map['tax'] as num).toDouble(),
      discount: (map['discount'] as num).toDouble(),
      total: (map['total'] as num).toDouble(),
      notes: map['notes'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  /// ===============================
  /// TO MAP
  /// ===============================

  Map<String, dynamic> toMap() {
    return {
      'branchId': branchId,
      'clientId': clientId,
      'employeeId': employeeId,
      'orderType': orderType.name,
      'status': status.name,
      'items': items.map((e) => e.toMap()).toList(),
      'payments': payments.map((e) => e.toMap()).toList(),
      'subtotal': subtotal,
      'tax': tax,
      'discount': discount,
      'total': total,
      'notes': notes,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  /// ===============================
  /// COPY WITH
  /// ===============================

  SalesOrderModel copyWith({
    SalesOrderStatus? status,
    List<SalesOrderPaymentModel>? payments,
    double? subtotal,
    double? tax,
    double? discount,
    double? total,
    Timestamp? updatedAt,
  }) {
    return SalesOrderModel(
      id: id,
      branchId: branchId,
      clientId: clientId,
      employeeId: employeeId,
      orderType: orderType,
      status: status ?? this.status,
      items: items,
      payments: payments ?? this.payments,
      subtotal: subtotal ?? this.subtotal,
      tax: tax ?? this.tax,
      discount: discount ?? this.discount,
      total: total ?? this.total,
      notes: notes,
      createdAt: createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
