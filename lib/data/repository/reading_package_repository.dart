import 'package:demo_book_reader/models/reading_package/reading_package_model.dart';

abstract class ReadingPackageRepository {
  /// Get Reading Package Information [ReadingPackageModel]
  Future<List<ReadingPackageModel>> getAll({required String token});
}
 