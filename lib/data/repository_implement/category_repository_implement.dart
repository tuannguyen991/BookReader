import 'dart:convert';

import 'package:demo_book_reader/data/remote/remote.dart';
import 'package:demo_book_reader/data/repository/category_repository.dart';
import 'package:demo_book_reader/models/category/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryRepositoryImplement implements CategoryRepository {
  @override
  Future<List<CategoryModel>> getCategoriesByName({
    required String token,
    required String name,
  }) async {
    const servicePath = '';

    final uri = Uri.https(
      Remote.authority,
      '${Remote.pathCategories}$servicePath',
      {'Filter': name},
    );

    final response = await http.get(
      uri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

      final authors = parsed
          .map<CategoryModel>((json) => CategoryModel.fromJson(json))
          .toList();
      return authors;
    }

    throw Exception('');
  }

  @override
  Future<List<CategoryModel>> getCategories({required String token}) async {
    const servicePath = '';

    final uri = Uri.https(
      Remote.authority,
      '${Remote.pathCategories}$servicePath',
    );

    final response = await http.get(
      uri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

      final authors = parsed
          .map<CategoryModel>((json) => CategoryModel.fromJson(json))
          .toList();
      return authors;
    }

    throw Exception('');
  }
}