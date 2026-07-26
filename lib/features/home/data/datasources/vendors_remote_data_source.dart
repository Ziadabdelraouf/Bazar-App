import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:bazar_group_1/core/network/books_dio.dart';
import 'package:bazar_group_1/core/constants/api_constants.dart';
import 'package:bazar_group_1/core/mock/mock_data_reader.dart';
import 'package:bazar_group_1/features/home/data/models/vendor_model.dart';

class VendorsRemoteDataSource {
  final Dio dio;

  VendorsRemoteDataSource(this.dio);

  Future<List<VendorModel>> getVendors() async {
      final response = await dio.get(ApiConstants.volumesEndpoint,
          queryParameters: {'q': 'flutter', 'maxResults': 20});
      final items = response.data['items'] as List? ?? [];
      return items.map((item) => VendorModel.fromJson(item)).toList();
  }

  Future<List<VendorModel>> getVendorsByCategory(String category) async {
      final response = await dio.get(ApiConstants.volumesEndpoint,
          queryParameters: {'q': 'subject:$category', 'maxResults': 20});
      final items = response.data['items'] as List? ?? [];
      return items.map((item) => VendorModel.fromJson(item)).toList();
  }

  List<VendorModel> getVendorsFromMock() {
    final items = mockData['items'] as List? ?? [];
    return items.map((item) => VendorModel.fromJson(item)).toList();
  }
}

final vendorsRemoteDataSourceProvider = Provider<VendorsRemoteDataSource>(
  (ref) => VendorsRemoteDataSource(ref.watch(booksDioProvider)),
);