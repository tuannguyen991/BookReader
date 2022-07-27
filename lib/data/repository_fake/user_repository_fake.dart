import 'package:demo_book_reader/data/repository/user_repository.dart';
import 'package:demo_book_reader/models/user/user_model.dart';

class UserRepositoryFake implements UserRepository {
  final List<UserModel> accountList = const [
    UserModel(
      id: '1',
      firstName: 'Tuan',
      lastName: 'Nguyen Kieu Anh',
      userName: 'tuan_nka',
      password: '123456',
      email: 'tuan_nka@gmail.com',
      phone: '0912341297',
      age: 21,
      gender: true,
      imageLink:
          'https://scontent.fsgn5-10.fna.fbcdn.net/v/t1.6435-9/163642920_2868459293419854_1511555735376202267_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=mm6pJg5Q9uUAX90B5W_&_nc_oc=AQnUiMSSqkqwEd0DdZW1DDvfMZaU9uV_Abup8CmlgAWUmtd1JXPTFaiyIgd08wQTcQ8&_nc_ht=scontent.fsgn5-10.fna&oh=00_AT81Tun19z_gOfcfuyKahzIEKs93mGQbITkBqopskaHtZQ&oe=6300FB61',
      imagaLinkRanking: 'https://cdn3.iconfinder.com/data/icons/stars-5/512/gold_star-128.png',
      readingTime: 232123,
      readBooks: 2,
    ),
    UserModel(
      id: '2',
      firstName: 'Tu',
      lastName: 'Huynh Anh',
      userName: 'tu_ha',
      password: '123456',
      email: 'tu_ha@gmail.com',
      phone: '0912386591',
      age: 23,
      gender: true,
      imageLink:
          'https://scontent.fsgn5-15.fna.fbcdn.net/v/t1.18169-1/13620850_1740161942925271_5963677317775186740_n.jpg?stp=dst-jpg_s200x200&_nc_cat=111&ccb=1-7&_nc_sid=7206a8&_nc_ohc=EsSxXt3jD94AX-MsvOT&_nc_ht=scontent.fsgn5-15.fna&oh=00_AT9zBRzhERe3PbIALe0pQ0oeqUL6axLY41DWgaZ1rEGE6w&oe=62FEC323',
          imagaLinkRanking: 'https://cdn3.iconfinder.com/data/icons/stars-5/512/silver_star-128.png',
      readingTime: 231,
      readBooks: 2,
    ),
    UserModel(
      id: '3',
      firstName: 'Min Woo',
      lastName: 'Kang',
      userName: 'minwoo_k',
      password: '123456',
      email: 'minwoo_k@gmail.com',
      phone: '0912128901',
      age: 21,
      gender: true,
      imageLink:
          "https://scontent.fsgn5'-3.fna.fbcdn.net/v/t1.6435-9/75435807_816844178772953_2805100865378058240_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=Y9YO0vp3egoAX9Ihprr&_nc_ht=scontent.fsgn5-3.fna&oh=00_AT_OB5QmNfXS8cn1DKlBgStFPG-RhXX5n6QT1g22KR0JPg&oe=630123F9",
         imagaLinkRanking: 'https://cdn3.iconfinder.com/data/icons/stars-5/512/bronze_star-128.png',
      readingTime: 341,
      readBooks: 2,
    ),
  ];

  @override
  Future<String> login(
      {required String username, required String password}) async {
    final user = accountList.firstWhere(
      (element) => element.userName == username && element.password == password,
      orElse: () => const UserModel(
        id: '0',
        firstName: '',
        lastName: '',
        userName: '',
        password: '',
        email: '',
        phone: '',
        age: 0,
        gender: true,
        imageLink: '',
        imagaLinkRanking: '',
        readingTime: 0,
        readBooks: 0,
      ),
    );
    // return token
    return user.userName;
  }

  @override
  Future<UserModel> getInfor({required String token}) async {
    // just demo
    final user = accountList.firstWhere((element) => element.userName == token);
    return user;
  }
}
