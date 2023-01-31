import 'package:demo_book_reader/data/repository/category_repository.dart';
import 'package:demo_book_reader/models/category/category_model.dart';

const List<CategoryModel> categoryList = [
  CategoryModel(
    id: '1',
    name: "Children's stories",
    imageLink:
        'https://img.freepik.com/premium-vector/little-cute-group-three-children-reading-books-sitting-sofa-flat-vector_627350-473.jpg?w=360',
  ),
  CategoryModel(
      id: '2',
      name: 'Juvenile Fiction',
      imageLink: 'https://www.dropbox.com/s/fwce7e0lgtv8mwl/fiction.jpg?raw=1'),
  CategoryModel(
    id: '3',
    name: 'Business',
    imageLink:
        'https://www.kindpng.com/picc/m/240-2409266_family-business-icon-png-transparent-png.png',
  ),
  CategoryModel(
    id: '4',
    name: 'Economy',
    imageLink: 'https://cdn-icons-png.flaticon.com/512/4634/4634988.png',
  ),
];

class CategoryRepositoryFake implements CategoryRepository {
  @override
  Future<List<CategoryModel>> getCategories({required String token}) async {
    // await Future.delayed(const Duration(seconds: 1));
    return categoryList;
  }

  @override
  Future<List<CategoryModel>> getCategoriesByName({
    required String token,
    required String name,
  }) async {
    if (name == '') {
      return [];
    }
    return categoryList.where(
      (element) {
        final result = element.name.toLowerCase();
        final input = name.toLowerCase();

        return result.contains(input);
      },
    ).toList();
  }
}
