import 'dart:convert';

import 'package:demo_book_reader/data/repository/reading_package_repository.dart';
import 'package:demo_book_reader/models/reading_package/reading_package_model.dart';
import 'package:http/http.dart' as http;

import '../remote/remote.dart';

class ReadingPackageRepositoryImplement implements ReadingPackageRepository {
  @override
  Future<List<ReadingPackageModel>> getAll({required String token}) async {
    final uri = Uri.https(
      Remote.authority,
      Remote.pathReadingPackages,
    );

    final response = await http.get(
      uri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      final list = parsed
          .map<ReadingPackageModel>(
              (json) => ReadingPackageModel.fromJson(json))
          .toList();
      return list;
    }

    throw Exception('');
  }
}
