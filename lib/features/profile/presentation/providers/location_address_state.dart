import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationAddressState {
  const LocationAddressState({
    required this.selectedLocation,
    this.addressTitle = '',
    this.fullAddress = '',
    this.isLoading = false,
    this.errorMessage,
  });
  final LatLng selectedLocation;
  final String addressTitle;
  final String fullAddress;
  final bool isLoading;
  final String? errorMessage;
  LocationAddressState copyWith({
    LatLng? selectedLocation,
    String? addressTitle,
    String? fullAddress,
    bool? isLoading,
    String? errorMessage,
    bool clearError = false,
  }) {
    return LocationAddressState(
      selectedLocation: selectedLocation ?? this.selectedLocation,
      addressTitle: addressTitle ?? this.addressTitle,
      fullAddress: fullAddress ?? this.fullAddress,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: clearError
          ? null
          : errorMessage ?? this.errorMessage,
    );
  }

}