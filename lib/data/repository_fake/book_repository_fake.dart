import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/models/book_model.dart';

class BookRepositoryFake implements BookRepository {
  final List<BookModel> books = [
    BookModel(name: "Android",authorId: "0001",rating: 5,bookUrl: "xxx.com"),
    BookModel(name: "Ios",authorId: "0002",rating: 5,bookUrl: "xxx.com"),
    BookModel(name: "Linux",authorId: "0003",rating: 5,bookUrl: "xxx.com"),
    BookModel(name: "Windows",authorId: "0004",rating: 5,bookUrl: "xxx.com"),
    BookModel(name: "Saw",authorId: "0005",rating: 5,bookUrl: "xxx.com"),
    BookModel(name: "Morden Family",authorId: "0006",rating: 5,bookUrl: "xxx.com"),
    BookModel(name: "Dragon Heart",authorId: "0007",rating: 5,bookUrl: "xxx.com"),
    BookModel(name: "Maximum Impact",authorId: "0008",rating: 5,bookUrl: "xxx.com"),
    BookModel(name: "Diablo",authorId: "0009",rating: 5,bookUrl: "xxx.com"),
    BookModel(name: "Starcraft",authorId: "0010",rating: 5,bookUrl: "xxx.com"),
    BookModel(name: "Warcraft",authorId: "0011",rating: 5,bookUrl: "xxx.com"),
    BookModel(name: "Overwatch",authorId: "00012",rating: 5,bookUrl: "xxx.com"),
    BookModel(name: "Heartstone",authorId: "0013",rating: 5,bookUrl: "xxx.com"),
  ];

  @override
  Future<List<BookModel>> getBooks() async {
    await Future.delayed(const Duration(seconds: 3));
    return List.unmodifiable(books);
  }

  @override
  Future<void> deleteBook(String authorId) async {
    books.removeWhere((element) => element.authorId == authorId);
  }

  @override
  Future<void> addBook(BookModel item) async {
    books.add(item);
  }
}


