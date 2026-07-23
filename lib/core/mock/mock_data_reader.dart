import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

///this variable contains mock data in the type (Map<String, dynamic>)
dynamic mockData;
Future<void> loadMockData() async {
  final String jsonString = await rootBundle.loadString(
    'assets/mock/books_data.json',
  );

  mockData = jsonDecode(jsonString);
}
