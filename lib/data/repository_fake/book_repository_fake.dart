import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/models/book_model.dart';

class BookRepositoryFake implements BookRepository {
  final List<BookModel> books = [
    BookModel(name: "Android",authorId: "0001",rating: 5,bookUrl: "images/BigBook1.png"),
    BookModel(name: "Ios",authorId: "0002",rating: 4,bookUrl: "images/BigBook2.png"),
    BookModel(name: "Linux",authorId: "0003",rating: 3,bookUrl: "images/BigBook3.png"),
    BookModel(name: "Windows",authorId: "0004",rating: 2,bookUrl: "images/BigBook4.png"),
    BookModel(name: "Saw",authorId: "0005",rating: 1,bookUrl: "images/BigBook5.png"),
    BookModel(name: "Morden Family",authorId: "0006",rating: 5,bookUrl: "images/BigBook1.png"),
    BookModel(name: "Dragon Heart",authorId: "0007",rating: 5,bookUrl: "images/BigBook1.png"),
    BookModel(name: "Maximum Impact",authorId: "0008",rating: 4,bookUrl: "images/BigBook1.png"),
    BookModel(name: "Diablo",authorId: "0009",rating: 4,bookUrl: "images/BigBook1.png"),
    BookModel(name: "Starcraft",authorId: "0010",rating: 3,bookUrl: "images/BigBook1.png"),
    BookModel(name: "Warcraft",authorId: "0011",rating: 3,bookUrl: "images/BigBook1.png"),
    BookModel(name: "Overwatch",authorId: "00012",rating: 2,bookUrl: "images/BigBook1.png"),
    BookModel(name: "Heartstone",authorId: "0013",rating: 2,bookUrl: "images/BigBook1.png"),
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


