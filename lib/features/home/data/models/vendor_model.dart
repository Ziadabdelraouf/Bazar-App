import 'package:bazar_group_1/features/home/domain/entities/vendor.dart';

class VendorModel extends Vendor {
  VendorModel({
    required super.name,
    super.imageUrl,
    super.rating,
  });

  factory VendorModel.fromJson(Map<String, dynamic> json) {
    final info = json['volumeInfo'] ?? {};

    return VendorModel(
      name: info['publisher'] ?? 'Unknown Vendor',
      imageUrl: info['imageLinks']?['thumbnail'],
      rating: (info['averageRating'] as num?)?.toDouble(),
    );
  }
}