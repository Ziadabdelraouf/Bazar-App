
import 'package:bazar_group_1/features/home/domain/entities/vendor.dart';

abstract class VendorsRepository{
    Future<List<Vendor>> getVendors();
    Future<List<Vendor>> getVendorsByCategory(String category);
}