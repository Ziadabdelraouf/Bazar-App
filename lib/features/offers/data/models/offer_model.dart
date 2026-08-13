import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class OfferModel {
  final String id;
  final int discountPercent;
  final String code;
  final bool isActive;

  const OfferModel({
    required this.id,
    required this.discountPercent,
    required this.code,
    required this.isActive,
  });

  factory OfferModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data() ?? {};
    
    return OfferModel(
      id: doc.id,
      discountPercent:
          (data['discountPercentage'] as num?)?.toInt() ?? 0,
      code: data['discountCode'] as String? ?? '',
      isActive: data['isActive'] as bool? ?? true,
    );
  }
}