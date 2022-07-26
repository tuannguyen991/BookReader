import 'package:demo_book_reader/data/repository/author_repository.dart';
import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/data/repository/category_repository.dart';
import 'package:demo_book_reader/data/repository/user_repository.dart';
import 'package:demo_book_reader/data/repository_fake/author_repository_fake.dart';
import 'package:demo_book_reader/data/repository_fake/book_repository_fake.dart';
import 'package:demo_book_reader/data/repository_fake/category_repository_fake.dart';
import 'package:demo_book_reader/data/repository_fake/user_repository_fake.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerFactory<UserRepository>(() => UserRepositoryFake());
  locator.registerFactory<BookRepository>(() => BookRepositoryFake());
  locator.registerFactory<AuthorRepository>(() => AuthorRepositoryFake());
  locator.registerFactory<CategoryRepository>(() => CategoryRepositoryFake());
}
