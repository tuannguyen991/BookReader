import 'package:demo_book_reader/data/repository/author_repository.dart';
import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/data/repository/category_repository.dart';
import 'package:demo_book_reader/data/repository/reading_package_repository.dart';
import 'package:demo_book_reader/data/repository/user_repository.dart';
import 'package:demo_book_reader/data/repository_implement/author_repository_implement.dart';
import 'package:demo_book_reader/data/repository_implement/book_repository_implement.dart';
import 'package:demo_book_reader/data/repository_implement/category_repository_implement.dart';
import 'package:demo_book_reader/data/repository_implement/reading_package_repository_implement.dart';
import 'package:demo_book_reader/data/repository_implement/user_repository_implement.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerFactory<UserRepository>(() => UserRepositoryImplement());
  locator.registerFactory<BookRepository>(() => BookRepositoryImplement());
  locator.registerFactory<AuthorRepository>(() => AuthorRepositoryImplement());
  locator.registerFactory<CategoryRepository>(() => CategoryRepositoryImplement());
  locator.registerFactory<ReadingPackageRepository>(() => ReadingPackageRepositoryImplement());
}