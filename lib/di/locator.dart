import 'package:demo_book_reader/data/repository/author_repository.dart';
import 'package:demo_book_reader/data/repository/book_repository.dart';
// import 'package:demo_book_reader/data/repository/user_repository.dart';
import 'package:demo_book_reader/data/repository_fake/author_repository_fake.dart';
import 'package:demo_book_reader/data/repository_fake/book_repository_fake.dart';
// import 'package:demo_book_reader/data/repository_fake/user_repository_fake.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setupLocator() {
  // locator.registerFactory<UserRepository>(() => UserRepositoryFake());
  locator.registerFactory<AuthorRepository>(() => AuthorRepositoryFake());
  locator.registerFactory<BookRepository>(() => BookRepositoryFake());
}
