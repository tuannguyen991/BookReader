import 'dart:convert';

import 'package:demo_book_reader/data/remote/remote.dart';
import 'package:demo_book_reader/data/repository/author_repository.dart';
import 'package:demo_book_reader/models/author/author_model.dart';
import 'package:http/http.dart' as http;

class AuthorRepositoryImplement implements AuthorRepository {
  @override
  Future<List<AuthorModel>> getAuthorsByName({
    required String token,
    required String name,
  }) async {
    const servicePath = '';

    final uri = Uri.https(
      Remote.authority,
      '${Remote.pathAuthors}$servicePath',
      {'Filter': name},
    );

    final response = await http.get(
      uri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

      final authors = parsed
          .map<AuthorModel>((json) => AuthorModel.fromJson(json))
          .toList();
      return authors;
    }

    throw Exception('');
  }

  @override
  Future<List<AuthorModel>> getAuthors({required String token}) async {
    const servicePath = '';

    final uri = Uri.https(
      Remote.authority,
      '${Remote.pathAuthors}$servicePath',
    );

    final response = await http.get(
      uri,
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

      final authors = parsed
          .map<AuthorModel>((json) => AuthorModel.fromJson(json))
          .toList();
      return authors;
    }

    throw Exception('');
  }
}