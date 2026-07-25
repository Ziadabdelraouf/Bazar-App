import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/offer.dart';

part 'offers_model.freezed.dart';
part 'offers_model.g.dart';

@freezed
abstract class OfferModel with _$OfferModel {
  const OfferModel._();

  const factory OfferModel({
    @JsonKey(readValue: _readTitle) required String title,
    @JsonKey(readValue: _readRetailPrice) num? retailPrice,
    @JsonKey(readValue: _readSellingPrice) num? sellingPrice,
    @JsonKey(readValue: _readImage) String? image,
    @JsonKey(readValue: _readUrl) String? url,
  }) = _OfferModel;

  factory OfferModel.fromJson(Map<String, dynamic> json) =>
      _$OfferModelFromJson(json);

  int get calculatedDiscount {
    final list = sellingPrice;
    final retail = retailPrice;

    if (list != null && retail != null && list > 0 && list > retail) {
      return (((list - retail) / list) * 100).round();
    } else if (retail != null && list != null && retail > 0 && retail > list) {
      return (((retail - list) / retail) * 100).round();
    }
    return 0;
  }

  Offer toEntity() {
    return Offer(
      title: title,
      discount: calculatedDiscount,
      image: image ?? '',
      url: url ?? '',
    );
  }
}

Object? _readTitle(Map json, String key) =>
    json['volumeInfo']?['title']?.toString() ?? 'Untitled';

Object? _readRetailPrice(Map json, String key) {
  final val = json['saleInfo']?['retailPrice']?['amount'];
  if (val is num) return val;
  if (val is String) return num.tryParse(val);
  return null;
}

Object? _readSellingPrice(Map json, String key) {
  final val = json['saleInfo']?['listPrice']?['amount'];
  if (val is num) return val;
  if (val is String) return num.tryParse(val);
  return null;
}

Object? _readImage(Map json, String key) {
  final image = json['volumeInfo']?['imageLinks']?['thumbnail']?.toString();
  return image;
}

Object? _readUrl(Map json, String key) =>
    json['volumeInfo']?['infoLink']?.toString();
