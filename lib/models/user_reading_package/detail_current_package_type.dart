import 'package:demo_book_reader/models/reading_package/reading_package_model.dart';

class DetailCurrentPackage {
  ReadingPackageModel detail;
  DateTime startDate;
  DateTime endDate;

  DetailCurrentPackage(this.detail, this.startDate, this.endDate);
}
