import 'dart:math';

import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/models/book/book_model.dart';

class BookRepositoryFake implements BookRepository {
  final List<BookModel> recommendedBooks = [
    const BookModel(
      id: 1,
      categoryName: '',
      name: 'Harry Potter And The Philosopher\'s Stone',
      authorName: 'J.K Rowling',
      decription:
          'Featuring vivid descriptions and an imaginative story line, it followed the adventures of the unlikely hero Harry Potter, a lonely orphan who discovers that he is actually a wizard and enrolls in the Hogwarts School of Witchcraft and Wizardry. The book received numerous awards, including the British Book Award.',
      numberPage: 342,
      image:
          'https://vn-test-11.slatic.net/p/88c8fe011aa2683f66e43efe9922dafc.jpg',
      ratingCount: 10,
      ratingTotal: 4.0,
    ),
    const BookModel(
      id: 2,
      categoryName: '',
      name: 'One Fair Wage',
      authorName: 'Saru Jayaraman',
      decription:
          'One Fair Wage policy would require all employers to pay the full minimum wage with fair, non-discriminatory tips on top, thus lifting millions of tipped and subminimum wage workers nationally out of poverty.',
      numberPage: 309,
      image:
          'https://images-us.bookshop.org/ingram/9781620975336.jpg?height=500&v=v2-ac1a853a2de82cd76c515b921c458c0f',
      ratingCount: 10,
      ratingTotal: 4.0,
    ),
    const BookModel(
      id: 3,
      categoryName: '',
      name: 'Choice Words',
      authorName: 'Annie Finch',
      decription:
          'Diction refers to a writer\'s purposeful word choice. Along with syntax, diction can be used to create tone and imagery in creative writing. Think about your writing\'s purpose and the message you want to convey.',
      numberPage: 512,
      image:
          'https://images-us.bookshop.org/ingram/9781642591484.jpg?height=500&v=v2-c7a0dab8fdd06ab0e6e549200b75df8e',
      ratingCount: 10,
      ratingTotal: 4.0,
    ),
    const BookModel(
      id: 4,
      categoryName: '',
      name: 'Beyond the Gender',
      authorName: 'Alok Vaid-Menon',
      decription:
          'In this installment, Beyond the Gender Binary, Alok Vaid-Menon challenges the world to see gender not in black and white, but in full color. Taking from their own experiences as a gender-nonconforming artist, they show us that gender is a malleable and creative form of expression. ',
      numberPage: 479,
      image:
          'https://images-us.bookshop.org/ingram/9780593094655.jpg?height=500&v=v2',
      ratingCount: 10,
      ratingTotal: 4.0,
    ),
    const BookModel(
      id: 5,
      categoryName: '',
      name: 'Felix Ever After',
      authorName: 'Kacen Callender',
      decription:
          'A Time Magazine Best YA Book of All Time From Stonewall and Lambda Award-winning author Kacen Callender comes a revelatory YA novel about a transgender teen grappling with identity and self-discovery while falling in love for the first time.',
      numberPage: 114,
      image:
          'https://images-us.bookshop.org/ingram/9780062820266.jpg?height=500&v=v2',
      ratingCount: 10,
      ratingTotal: 4.0,
    ),
  ];

  @override
  Future<List<BookModel>> getRecommendedBook({required int userId}) async {
    return List.unmodifiable(
        (recommendedBooks..shuffle(Random(userId))).sublist(0, 2));
  }
}
