import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bazar_group_1/features/home/domain/entities/vendor.dart';
import 'package:bazar_group_1/features/home/domain/repositories/vendors_repository.dart';
import 'package:bazar_group_1/features/home/data/datasources/vendors_remote_data_source.dart';
import 'package:bazar_group_1/features/home/data/models/vendor_model.dart';

class VendorsRepositoryImpl implements VendorsRepository {
  final VendorsRemoteDataSource remoteDataSource;

  VendorsRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Vendor>> getVendors() async {
    try {
      final models = await remoteDataSource.getVendors();
      return _deduplicate(models);
    } on DioException catch (e) {
      if (_isServerSideIssue(e)) {
        final mockModels = remoteDataSource.getVendorsFromMock();
        return _deduplicate(mockModels.take(20).toList());
      }
      rethrow;
    }
  }

  @override
  Future<List<Vendor>> getVendorsByCategory(String category) async {
    try {
      final models = await remoteDataSource.getVendorsByCategory(category);
      return _deduplicate(models);
    } on DioException catch (e) {
      if (_isServerSideIssue(e)) {
        final mockModels = remoteDataSource.getVendorsFromMock();
        return _deduplicate(mockModels.take(20).toList());
      }
      rethrow;
    }
  }

  bool _isServerSideIssue(DioException e) {
    return e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout ||
        (e.response?.statusCode != null && e.response!.statusCode! >= 500);
  }

  List<Vendor> _deduplicate(List<VendorModel> models) {
    final Map<String, Vendor> uniqueVendors = {};
    for (final model in models) {
      if (model.name == 'Unknown Vendor') {
        continue;
      }
      if (!uniqueVendors.containsKey(model.name)) {
        uniqueVendors[model.name] = model;
      }
    }
    return uniqueVendors.values.toList();
  }
}

final vendorsRepositoryProvider = Provider<VendorsRepository>(
  (ref) => VendorsRepositoryImpl(ref.watch(vendorsRemoteDataSourceProvider)),
);