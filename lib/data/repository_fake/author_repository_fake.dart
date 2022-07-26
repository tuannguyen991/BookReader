import 'package:demo_book_reader/data/repository/author_repository.dart';
import 'package:demo_book_reader/models/author/author_model.dart';

class AuthorRepositoryFake implements AuthorRepository {
  final List<AuthorModel> authorList = const [
    AuthorModel(
      id: "1",
      name: "J. K. Rowling",
      imageLink:
          "https://instagram.fsgn5-2.fna.fbcdn.net/v/t51.2885-19/139602632_1002634246809605_239709236590657798_n.jpg?stp=dst-jpg_s150x150&_nc_ht=instagram.fsgn5-2.fna.fbcdn.net&_nc_cat=105&_nc_ohc=2U-zW6Wgzb8AX_-lAbV&edm=AOQ1c0wBAAAA&ccb=7-5&oh=00_AT845LuW8AxTul5yZHCRQPtzaOUPZXi7v7ojiIrzMRYenQ&oe=62E0CA64&_nc_sid=8fd12b",
    ),
    AuthorModel(
      id: "2",
      name: "Eva Gray",
      imageLink:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6RiJfqmVgObeVExih1kwcYB436elPIgmbKw&usqp=CAU",
    ),
    AuthorModel(
      id: "3",
      name: "Teofilo Reyes",
      imageLink:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQazBCc0hPE6m3U_IqcBDU-oL8-U6n8E02IzQ&usqp=CAU",
    ),
    AuthorModel(
      id: "4",
      name: "Saru Jayaraman",
      imageLink:
          "https://scontent.fsgn5-14.fna.fbcdn.net/v/t1.6435-9/158900679_361613908619003_3323147903344266764_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=aFTEo5CYhLkAX-hveTX&_nc_ht=scontent.fsgn5-14.fna&oh=00_AT-V1aEyMpA2OI3RL6bM_phEoQPHNd23vNxR5t6kVc5Dyw&oe=63017A4F",
    ),
    AuthorModel(
      id: "5",
      name: "Ben Horowitz",
      imageLink:
          "https://i.insider.com/54985d2969bedd9d42f51629?width=1136&format=jpeg",
    ),
    AuthorModel(
      id: "6",
      name: "Abhijit V. Banerjee",
      imageLink:
          "https://images.firstpost.com/wp-content/uploads/2022/03/Abhijit-Banerjee-640.jpg?impolicy=website&width=1200&height=800",
    ),
    AuthorModel(
      id: "7",
      name: "Esther Duflo",
      imageLink:
          "https://unctad.org/sites/default/files/2021-06/Esther%20Duflo_2_credit%20Bryce%20Vickmark_1200x675_0.jpg",
    ),
  ];
  @override
  Future<List<AuthorModel>> getAuthors({required String token}) async {
    return authorList;
  }
}
