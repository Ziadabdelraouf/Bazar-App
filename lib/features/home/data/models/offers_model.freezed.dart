// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offers_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OfferModel {

@JsonKey(readValue: _readTitle) String get title;@JsonKey(readValue: _readRetailPrice) num? get retailPrice;@JsonKey(readValue: _readSellingPrice) num? get sellingPrice;@JsonKey(readValue: _readImage) String? get image;@JsonKey(readValue: _readUrl) String? get url;
/// Create a copy of OfferModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfferModelCopyWith<OfferModel> get copyWith => _$OfferModelCopyWithImpl<OfferModel>(this as OfferModel, _$identity);

  /// Serializes this OfferModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfferModel&&(identical(other.title, title) || other.title == title)&&(identical(other.retailPrice, retailPrice) || other.retailPrice == retailPrice)&&(identical(other.sellingPrice, sellingPrice) || other.sellingPrice == sellingPrice)&&(identical(other.image, image) || other.image == image)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,retailPrice,sellingPrice,image,url);

@override
String toString() {
  return 'OfferModel(title: $title, retailPrice: $retailPrice, sellingPrice: $sellingPrice, image: $image, url: $url)';
}


}

/// @nodoc
abstract mixin class $OfferModelCopyWith<$Res>  {
  factory $OfferModelCopyWith(OfferModel value, $Res Function(OfferModel) _then) = _$OfferModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(readValue: _readTitle) String title,@JsonKey(readValue: _readRetailPrice) num? retailPrice,@JsonKey(readValue: _readSellingPrice) num? sellingPrice,@JsonKey(readValue: _readImage) String? image,@JsonKey(readValue: _readUrl) String? url
});




}
/// @nodoc
class _$OfferModelCopyWithImpl<$Res>
    implements $OfferModelCopyWith<$Res> {
  _$OfferModelCopyWithImpl(this._self, this._then);

  final OfferModel _self;
  final $Res Function(OfferModel) _then;

/// Create a copy of OfferModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? retailPrice = freezed,Object? sellingPrice = freezed,Object? image = freezed,Object? url = freezed,}) {
  return _then(OfferModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,retailPrice: freezed == retailPrice ? _self.retailPrice : retailPrice // ignore: cast_nullable_to_non_nullable
as num?,sellingPrice: freezed == sellingPrice ? _self.sellingPrice : sellingPrice // ignore: cast_nullable_to_non_nullable
as num?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OfferModel].
extension OfferModelPatterns on OfferModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OfferModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OfferModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OfferModel value)  $default,){
final _that = this;
switch (_that) {
case _OfferModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OfferModel value)?  $default,){
final _that = this;
switch (_that) {
case _OfferModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(readValue: _readTitle)  String title, @JsonKey(readValue: _readRetailPrice)  num? retailPrice, @JsonKey(readValue: _readSellingPrice)  num? sellingPrice, @JsonKey(readValue: _readImage)  String? image, @JsonKey(readValue: _readUrl)  String? url)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OfferModel() when $default != null:
return $default(_that.title,_that.retailPrice,_that.sellingPrice,_that.image,_that.url);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(readValue: _readTitle)  String title, @JsonKey(readValue: _readRetailPrice)  num? retailPrice, @JsonKey(readValue: _readSellingPrice)  num? sellingPrice, @JsonKey(readValue: _readImage)  String? image, @JsonKey(readValue: _readUrl)  String? url)  $default,) {final _that = this;
switch (_that) {
case _OfferModel():
return $default(_that.title,_that.retailPrice,_that.sellingPrice,_that.image,_that.url);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(readValue: _readTitle)  String title, @JsonKey(readValue: _readRetailPrice)  num? retailPrice, @JsonKey(readValue: _readSellingPrice)  num? sellingPrice, @JsonKey(readValue: _readImage)  String? image, @JsonKey(readValue: _readUrl)  String? url)?  $default,) {final _that = this;
switch (_that) {
case _OfferModel() when $default != null:
return $default(_that.title,_that.retailPrice,_that.sellingPrice,_that.image,_that.url);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OfferModel extends OfferModel {
  const _OfferModel({@JsonKey(readValue: _readTitle) required this.title, @JsonKey(readValue: _readRetailPrice) this.retailPrice, @JsonKey(readValue: _readSellingPrice) this.sellingPrice, @JsonKey(readValue: _readImage) this.image, @JsonKey(readValue: _readUrl) this.url}): super._();
  factory _OfferModel.fromJson(Map<String, dynamic> json) => _$OfferModelFromJson(json);

@override@JsonKey(readValue: _readTitle) final  String title;
@override@JsonKey(readValue: _readRetailPrice) final  num? retailPrice;
@override@JsonKey(readValue: _readSellingPrice) final  num? sellingPrice;
@override@JsonKey(readValue: _readImage) final  String? image;
@override@JsonKey(readValue: _readUrl) final  String? url;

/// Create a copy of OfferModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OfferModelCopyWith<_OfferModel> get copyWith => __$OfferModelCopyWithImpl<_OfferModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OfferModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OfferModel&&(identical(other.title, title) || other.title == title)&&(identical(other.retailPrice, retailPrice) || other.retailPrice == retailPrice)&&(identical(other.sellingPrice, sellingPrice) || other.sellingPrice == sellingPrice)&&(identical(other.image, image) || other.image == image)&&(identical(other.url, url) || other.url == url));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,retailPrice,sellingPrice,image,url);

@override
String toString() {
  return 'OfferModel(title: $title, retailPrice: $retailPrice, sellingPrice: $sellingPrice, image: $image, url: $url)';
}


}

/// @nodoc
abstract mixin class _$OfferModelCopyWith<$Res> implements $OfferModelCopyWith<$Res> {
  factory _$OfferModelCopyWith(_OfferModel value, $Res Function(_OfferModel) _then) = __$OfferModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(readValue: _readTitle) String title,@JsonKey(readValue: _readRetailPrice) num? retailPrice,@JsonKey(readValue: _readSellingPrice) num? sellingPrice,@JsonKey(readValue: _readImage) String? image,@JsonKey(readValue: _readUrl) String? url
});




}
/// @nodoc
class __$OfferModelCopyWithImpl<$Res>
    implements _$OfferModelCopyWith<$Res> {
  __$OfferModelCopyWithImpl(this._self, this._then);

  final _OfferModel _self;
  final $Res Function(_OfferModel) _then;

/// Create a copy of OfferModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? retailPrice = freezed,Object? sellingPrice = freezed,Object? image = freezed,Object? url = freezed,}) {
  return _then(_OfferModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,retailPrice: freezed == retailPrice ? _self.retailPrice : retailPrice // ignore: cast_nullable_to_non_nullable
as num?,sellingPrice: freezed == sellingPrice ? _self.sellingPrice : sellingPrice // ignore: cast_nullable_to_non_nullable
as num?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
