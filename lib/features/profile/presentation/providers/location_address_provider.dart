import 'package:bazar_group_1/features/profile/presentation/notifier/location_address_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'location_address_state.dart';

final locationAddressProvider =
    NotifierProvider<LocationAddressNotifier, LocationAddressState>(
  LocationAddressNotifier.new,
);