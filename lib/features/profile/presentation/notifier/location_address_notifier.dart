import 'dart:ui' show Locale;

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../providers/location_address_state.dart';

class LocationAddressNotifier extends Notifier<LocationAddressState> {
  static const LatLng initialLocation = LatLng(
    30.0444,
    31.2357,
  );

  int _latestRequestId = 0;

  @override
  LocationAddressState build() {
    return const LocationAddressState(
      selectedLocation: initialLocation,
    );
  }

  Future<void> selectLocation(
    LatLng location, {
    required Locale locale,
  }) async {
    final requestId = ++_latestRequestId;

    state = state.copyWith(
      selectedLocation: location,
      addressTitle: '',
      fullAddress: '',
      isLoading: true,
      clearError: true,
    );

    try {
      final geocoderAvailable = await isPresent();

      if (!_isCurrentRequest(requestId)) return;

      debugPrint('Geocoder available: $geocoderAvailable');

      if (!geocoderAvailable) {
        _setError(
          requestId: requestId,
          errorCode: 'address_unavailable',
        );
        return;
      }

      final localeIdentifier = _getLocaleIdentifier(locale);

      await setLocaleIdentifier(localeIdentifier);

      debugPrint(
        'Reverse geocoding started with locale: $localeIdentifier',
      );

      final placemarks = await placemarkFromCoordinates(
        location.latitude,
        location.longitude,
      );

      if (!_isCurrentRequest(requestId)) return;

      debugPrint('Placemark count: ${placemarks.length}');

      if (placemarks.isEmpty) {
        _setError(
          requestId: requestId,
          errorCode: 'address_not_found',
        );
        return;
      }

      final placemark = placemarks.first;

      final addressTitle = _buildAddressTitle(placemark);
      final fullAddress = _buildFullAddress(placemark);

      if (addressTitle.isEmpty && fullAddress.isEmpty) {
        _setError(
          requestId: requestId,
          errorCode: 'address_not_found',
        );
        return;
      }

      state = state.copyWith(
        addressTitle: addressTitle.isNotEmpty
            ? addressTitle
            : _buildFallbackTitle(placemark),
        fullAddress: fullAddress,
        isLoading: false,
        clearError: true,
      );
    } on PlatformException catch (error, stackTrace) {
      debugPrint(
        'Reverse geocoding platform error:\n'
        'Code: ${error.code}\n'
        'Message: ${error.message}\n'
        'Details: ${error.details}',
      );

      debugPrintStack(stackTrace: stackTrace);

      _setError(
        requestId: requestId,
        errorCode: 'address_unavailable',
      );
    } catch (error, stackTrace) {
      debugPrint('Reverse geocoding unknown error: $error');
      debugPrintStack(stackTrace: stackTrace);

      _setError(
        requestId: requestId,
        errorCode: 'address_unavailable',
      );
    }
  }

  String _getLocaleIdentifier(Locale locale) {
    if (locale.languageCode == 'ar') {
      return 'ar_EG';
    }

    return 'en';
  }

  String _buildAddressTitle(Placemark placemark) {
    return _joinAddressParts([
      placemark.street,
      placemark.subLocality,
    ]);
  }

  String _buildFallbackTitle(Placemark placemark) {
    return _joinAddressParts([
      placemark.locality,
      placemark.administrativeArea,
    ]);
  }

  String _buildFullAddress(Placemark placemark) {
    return _joinAddressParts([
      placemark.street,
      placemark.subLocality,
      placemark.locality,
      placemark.subAdministrativeArea,
      placemark.administrativeArea,
      placemark.postalCode,
      placemark.country,
    ]);
  }

  String _joinAddressParts(List<String?> values) {
    final addressParts = <String>[];

    for (final value in values) {
      final cleanedValue = value?.trim() ?? '';

      if (cleanedValue.isEmpty) continue;
      if (addressParts.contains(cleanedValue)) continue;

      addressParts.add(cleanedValue);
    }

    return addressParts.join(', ');
  }

  bool _isCurrentRequest(int requestId) {
    return requestId == _latestRequestId;
  }

  void _setError({
    required int requestId,
    required String errorCode,
  }) {
    if (!_isCurrentRequest(requestId)) return;

    state = state.copyWith(
      addressTitle: '',
      fullAddress: '',
      isLoading: false,
      errorMessage: errorCode,
    );
  }
}