import 'package:demo_book_reader/data/repository/reading_package_repository.dart';
import 'package:demo_book_reader/models/reading_package/reading_package_model.dart';

class ReadingPackageRepositoryImplement implements ReadingPackageRepository {
  @override
  Future<List<ReadingPackageModel>> getAll({required String token}) async {
    // TODO: call API
    List<ReadingPackageModel> list = const [
      ReadingPackageModel(
          id: '0', name: 'Gói Đọc Sách Tháng', duration: 1, price: 50000, discountPercentage: 0),
      ReadingPackageModel(
          id: '1', name: 'Gói Đọc Sách 3 Tháng', duration: 3, price: 150000, discountPercentage: 16),
      ReadingPackageModel(
          id: '2', name: 'Gói Đọc Sách Năm', duration: 12, price: 600000, discountPercentage: 25),
    ];
    return list;
  }
}
