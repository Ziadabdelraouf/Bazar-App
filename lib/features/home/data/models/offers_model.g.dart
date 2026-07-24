// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OfferModel _$OfferModelFromJson(Map<String, dynamic> json) => _OfferModel(
  title: _readTitle(json, 'title') as String,
  retailPrice: _readRetailPrice(json, 'retailPrice') as num?,
  sellingPrice: _readSellingPrice(json, 'sellingPrice') as num?,
  image: _readImage(json, 'image') as String?,
  url: _readUrl(json, 'url') as String?,
);

Map<String, dynamic> _$OfferModelToJson(_OfferModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'retailPrice': instance.retailPrice,
      'sellingPrice': instance.sellingPrice,
      'image': instance.image,
      'url': instance.url,
    };
