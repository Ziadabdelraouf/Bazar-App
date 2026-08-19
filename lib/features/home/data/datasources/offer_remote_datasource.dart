import 'package:bazar_group_1/core/mock/mock_data_reader.dart';
import 'package:bazar_group_1/core/network/books_dio.dart';
import 'package:bazar_group_1/features/home/data/models/offers_model.dart';

class OfferRemoteDatasource {
  final BooksDio _dio;
  const OfferRemoteDatasource(this._dio);

  Future<List<OfferModel>> getOffers() async {
    List<dynamic> items = mockData['items'];

    /// always retun free items so no offers
    // try {
    //   final response = await _dio.dio.get(
    //     ApiConstants.volumesEndpoint,
    //     queryParameters: {
    //       'q': 'bestseller',
    //       'filter': "paid-ebooks",
    //       'maxResults': 35,
    //     },
    //   );
    //   items = response.data['items'] ?? mockData['items'];
    // } catch (e) {
    //   debugPrint('Error fetching offers: $e');
    // }

    return items
        .map((e) => OfferModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
