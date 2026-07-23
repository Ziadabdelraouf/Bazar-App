/*
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/features/home/domain/entities/vendor.dart';
import 'package:bazar_group_1/features/home/data/repositories/vendors_repository_impl.dart';

class VendorsNotifier extends AsyncNotifier<List<Vendor>> {
  @override
  Future<List<Vendor>> build() async {
    final repository = ref.watch(vendorsRepositoryProvider);
    return repository.getVendors();
  }

  Future<void> loadVendors({String? category}) async {
    state = const AsyncLoading();
    final repository = ref.read(vendorsRepositoryProvider);

    state = await AsyncValue.guard(() {
      if (category == null) {
        return repository.getVendors();
      }
      return repository.getVendorsByCategory(category);
    });
  }
}

final vendorsNotifierProvider = AsyncNotifierProvider<VendorsNotifier, List<Vendor>>(
  () => VendorsNotifier(),
);
*/