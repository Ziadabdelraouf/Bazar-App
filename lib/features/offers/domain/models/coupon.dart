import 'package:flutter/material.dart';

class Coupon {
  final int discountPercent;
  final Color backgroundColor;
  final String code;
  const Coupon({
    required this.discountPercent,
    required this.backgroundColor,
    required this.code,
  });
}
