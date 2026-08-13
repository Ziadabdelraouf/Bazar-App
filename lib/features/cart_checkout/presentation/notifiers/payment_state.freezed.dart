// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentMethodState {

 PaymentType get type; String get cardNumber; String get cardHolderName; String get expiryDate; String get cvv;
/// Create a copy of PaymentMethodState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentMethodStateCopyWith<PaymentMethodState> get copyWith => _$PaymentMethodStateCopyWithImpl<PaymentMethodState>(this as PaymentMethodState, _$identity);

  /// Serializes this PaymentMethodState to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentMethodState&&(identical(other.type, type) || other.type == type)&&(identical(other.cardNumber, cardNumber) || other.cardNumber == cardNumber)&&(identical(other.cardHolderName, cardHolderName) || other.cardHolderName == cardHolderName)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.cvv, cvv) || other.cvv == cvv));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,cardNumber,cardHolderName,expiryDate,cvv);

@override
String toString() {
  return 'PaymentMethodState(type: $type, cardNumber: $cardNumber, cardHolderName: $cardHolderName, expiryDate: $expiryDate, cvv: $cvv)';
}


}

/// @nodoc
abstract mixin class $PaymentMethodStateCopyWith<$Res>  {
  factory $PaymentMethodStateCopyWith(PaymentMethodState value, $Res Function(PaymentMethodState) _then) = _$PaymentMethodStateCopyWithImpl;
@useResult
$Res call({
 PaymentType type, String cardNumber, String cardHolderName, String expiryDate, String cvv
});




}
/// @nodoc
class _$PaymentMethodStateCopyWithImpl<$Res>
    implements $PaymentMethodStateCopyWith<$Res> {
  _$PaymentMethodStateCopyWithImpl(this._self, this._then);

  final PaymentMethodState _self;
  final $Res Function(PaymentMethodState) _then;

/// Create a copy of PaymentMethodState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? cardNumber = null,Object? cardHolderName = null,Object? expiryDate = null,Object? cvv = null,}) {
  return _then(PaymentMethodState(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PaymentType,cardNumber: null == cardNumber ? _self.cardNumber : cardNumber // ignore: cast_nullable_to_non_nullable
as String,cardHolderName: null == cardHolderName ? _self.cardHolderName : cardHolderName // ignore: cast_nullable_to_non_nullable
as String,expiryDate: null == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as String,cvv: null == cvv ? _self.cvv : cvv // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentMethodState].
extension PaymentMethodStatePatterns on PaymentMethodState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentMethodState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentMethodState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentMethodState value)  $default,){
final _that = this;
switch (_that) {
case _PaymentMethodState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentMethodState value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentMethodState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PaymentType type,  String cardNumber,  String cardHolderName,  String expiryDate,  String cvv)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentMethodState() when $default != null:
return $default(_that.type,_that.cardNumber,_that.cardHolderName,_that.expiryDate,_that.cvv);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PaymentType type,  String cardNumber,  String cardHolderName,  String expiryDate,  String cvv)  $default,) {final _that = this;
switch (_that) {
case _PaymentMethodState():
return $default(_that.type,_that.cardNumber,_that.cardHolderName,_that.expiryDate,_that.cvv);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PaymentType type,  String cardNumber,  String cardHolderName,  String expiryDate,  String cvv)?  $default,) {final _that = this;
switch (_that) {
case _PaymentMethodState() when $default != null:
return $default(_that.type,_that.cardNumber,_that.cardHolderName,_that.expiryDate,_that.cvv);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentMethodState extends PaymentMethodState {
  const _PaymentMethodState({this.type = PaymentType.cash, this.cardNumber = '', this.cardHolderName = '', this.expiryDate = '', this.cvv = ''}): super._();
  factory _PaymentMethodState.fromJson(Map<String, dynamic> json) => _$PaymentMethodStateFromJson(json);

@override@JsonKey() final  PaymentType type;
@override@JsonKey() final  String cardNumber;
@override@JsonKey() final  String cardHolderName;
@override@JsonKey() final  String expiryDate;
@override@JsonKey() final  String cvv;

/// Create a copy of PaymentMethodState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentMethodStateCopyWith<_PaymentMethodState> get copyWith => __$PaymentMethodStateCopyWithImpl<_PaymentMethodState>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentMethodStateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentMethodState&&(identical(other.type, type) || other.type == type)&&(identical(other.cardNumber, cardNumber) || other.cardNumber == cardNumber)&&(identical(other.cardHolderName, cardHolderName) || other.cardHolderName == cardHolderName)&&(identical(other.expiryDate, expiryDate) || other.expiryDate == expiryDate)&&(identical(other.cvv, cvv) || other.cvv == cvv));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,cardNumber,cardHolderName,expiryDate,cvv);

@override
String toString() {
  return 'PaymentMethodState(type: $type, cardNumber: $cardNumber, cardHolderName: $cardHolderName, expiryDate: $expiryDate, cvv: $cvv)';
}


}

/// @nodoc
abstract mixin class _$PaymentMethodStateCopyWith<$Res> implements $PaymentMethodStateCopyWith<$Res> {
  factory _$PaymentMethodStateCopyWith(_PaymentMethodState value, $Res Function(_PaymentMethodState) _then) = __$PaymentMethodStateCopyWithImpl;
@override @useResult
$Res call({
 PaymentType type, String cardNumber, String cardHolderName, String expiryDate, String cvv
});




}
/// @nodoc
class __$PaymentMethodStateCopyWithImpl<$Res>
    implements _$PaymentMethodStateCopyWith<$Res> {
  __$PaymentMethodStateCopyWithImpl(this._self, this._then);

  final _PaymentMethodState _self;
  final $Res Function(_PaymentMethodState) _then;

/// Create a copy of PaymentMethodState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? cardNumber = null,Object? cardHolderName = null,Object? expiryDate = null,Object? cvv = null,}) {
  return _then(_PaymentMethodState(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as PaymentType,cardNumber: null == cardNumber ? _self.cardNumber : cardNumber // ignore: cast_nullable_to_non_nullable
as String,cardHolderName: null == cardHolderName ? _self.cardHolderName : cardHolderName // ignore: cast_nullable_to_non_nullable
as String,expiryDate: null == expiryDate ? _self.expiryDate : expiryDate // ignore: cast_nullable_to_non_nullable
as String,cvv: null == cvv ? _self.cvv : cvv // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
