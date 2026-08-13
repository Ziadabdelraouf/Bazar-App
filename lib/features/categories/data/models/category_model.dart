import 'package:bazar_group_1/features/categories/domain/entities/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel extends Category {
  const CategoryModel({
    required super.id,
    required super.nameEn,
    required super.nameAr,
  });

  factory CategoryModel.fromJson(String id, Map<String, dynamic> json) {
    return CategoryModel(
      id: id,
      nameEn: json['nameEn'] as String? ?? '',
      nameAr: json['nameAr'] as String? ?? '',
    );
  }

  factory CategoryModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data() ?? {};
    final nameEn = data['nameEn'] as String? ?? '';
    final nameAr = data['nameAr'] as String? ?? '';
    return CategoryModel(
      id: doc.id,
      nameEn: nameEn,
      nameAr: nameAr.isNotEmpty ? nameAr : nameEn,
    );
  }
}