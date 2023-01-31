import 'package:demo_book_reader/data/repository/author_repository.dart';
import 'package:demo_book_reader/models/author/author_model.dart';

const List<AuthorModel> authorList = [
  AuthorModel(
      id: '1',
      name: 'J. K. Rowling',
      imageLink: 'https://www.dropbox.com/s/wholj2q1o8floky/rowling.jpg?raw=1'),
  AuthorModel(
    id: '2',
    name: 'Eva Gray',
    imageLink:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6RiJfqmVgObeVExih1kwcYB436elPIgmbKw&usqp=CAU',
  ),
  AuthorModel(
    id: '3',
    name: 'Teofilo Reyes',
    imageLink:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQazBCc0hPE6m3U_IqcBDU-oL8-U6n8E02IzQ&usqp=CAU',
  ),
  AuthorModel(
      id: '4',
      name: 'Saru Jayaraman',
      imageLink:
          'https://www.dropbox.com/s/b0juuv3gquzjukb/jayaraman.jpg?raw=1'),
  AuthorModel(
    id: '5',
    name: 'Ben Horowitz',
    imageLink:
        'https://i.insider.com/54985d2969bedd9d42f51629?width=1136&format=jpeg',
  ),
  AuthorModel(
    id: '6',
    name: 'Abhijit V. Banerjee',
    imageLink:
        'https://images.firstpost.com/wp-content/uploads/2022/03/Abhijit-Banerjee-640.jpg?impolicy=website&width=1200&height=800',
  ),
  AuthorModel(
    id: '7',
    name: 'Esther Duflo',
    imageLink:
        'https://unctad.org/sites/default/files/2021-06/Esther%20Duflo_2_credit%20Bryce%20Vickmark_1200x675_0.jpg',
  ),
];

class AuthorRepositoryFake implements AuthorRepository {
  @override
  Future<List<AuthorModel>> getAuthors({required String token}) async {
    return authorList;
  }

  @override
  Future<List<AuthorModel>> getAuthorsByName({
    required String token,
    required String name,
  }) async {
    if (name == '') {
      return [];
    }
    return authorList.where(
      (element) {
        final result = element.name.toLowerCase();
        final input = name.toLowerCase();

        return result.contains(input);
      },
    ).toList();
  }
}
