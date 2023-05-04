import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/di/locator.dart';
import 'package:demo_book_reader/features/book_detail/book_detail_page.dart';
import 'package:demo_book_reader/features/category_detail/bloc/category_detail_bloc.dart';
import 'package:demo_book_reader/models/category/category_model.dart';
import 'package:demo_book_reader/share/extensions/build_context_extensions.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/model_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetailPage extends StatefulWidget {
  const CategoryDetailPage({
    Key? key,
    required this.category,
  }) : super(key: key);

  final CategoryModel category;

  @override
  State<CategoryDetailPage> createState() => _CategoryDetailPageState();
}

class _CategoryDetailPageState extends State<CategoryDetailPage> {
  final _bloc = CategoryDetailBloc(
    bookRepository: locator<BookRepository>(),
  );

  @override
  void initState() {
    super.initState();
    _bloc.add(CategoryDetailLoaded(categoryId: widget.category.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        appBar: AppBar(title: Text(widget.category.name)),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    final categoryItem = widget.category;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(double16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<CategoryDetailBloc, CategoryDetailState>(
              builder: (context, state) {
                var books = state.books;

                return Column(
                  children: List<Widget>.generate(
                    state.books.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: double8),
                      child: InkWell(
                        child:
                            BookItem(bookItem: books[index], isLibrary: true),
                        onTap: () {
                          context.navigateTo(
                              BookDetailPage(bookItem: books[index]));
                        },
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
