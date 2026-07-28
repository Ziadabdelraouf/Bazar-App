import 'dart:convert';
import 'package:flutter/services.dart';

dynamic mockData;

Future<void> loadMockData() async {
  final String jsonString = await rootBundle.loadString(
    'assets/mock/books_data.json',
  );

  mockData = jsonDecode(jsonString);
}
