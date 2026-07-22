import 'package:bazar_group_1/features/home/domain/entities/vendor.dart';
import 'package:bazar_group_1/features/home/domain/repositories/vendors_repository.dart';
import 'package:bazar_group_1/features/home/data/datasources/vendors_remote_data_source.dart';

class VendorsRepositoryImpl implements VendorsRepository {
  final VendorsRemoteDataSource remoteDataSource;

  VendorsRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Vendor>> getVendors() async {
    final models = await remoteDataSource.getVendors();

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