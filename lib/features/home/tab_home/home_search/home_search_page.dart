import 'package:demo_book_reader/data/repository/author_repository.dart';
import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/data/repository/category_repository.dart';
import 'package:demo_book_reader/di/locator.dart';
import 'package:demo_book_reader/extensions/build_context_extensions.dart';
import 'package:demo_book_reader/features/book_detail/book_detail_page.dart';
import 'package:demo_book_reader/features/home/tab_home/home_search/bloc/home_search_bloc.dart';
import 'package:demo_book_reader/models/author/author_model.dart';
import 'package:demo_book_reader/models/book/book_model.dart';
import 'package:demo_book_reader/models/category/category_model.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/model_item.dart';
import 'package:demo_book_reader/widgets/header_section.dart';
import 'package:demo_book_reader/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeSearchPage extends StatefulWidget {
  const HomeSearchPage({Key? key}) : super(key: key);

  @override
  State<HomeSearchPage> createState() => _HomeSearchPageState();
}

class _HomeSearchPageState extends State<HomeSearchPage> {
  final _bloc = HomeSearchBloc(
    bookRepository: locator<BookRepository>(),
    authorRepository: locator<AuthorRepository>(),
    categoryRepository: locator<CategoryRepository>(),
  );

  @override
  void initState() {
    super.initState();

    _bloc.add(HomeSearchLoaded());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Builder(builder: (context) {
      return SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(double16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      context.off();
                    },
                    padding: const EdgeInsets.all(double4),
                    constraints: const BoxConstraints(),
                  ),
                  horizontalSpace8,
                  Flexible(
                    child: SearchBar(isTextInput: true, bloc: _bloc),
                  ),
                ],
              ),
              HeaderSection(
                title: 'Lịch sử tìm kiếm',
                subtitle: 'Xóa lịch sử',
                onPressed: () {},
              ),
              BlocBuilder<HomeSearchBloc, HomeSearchState>(
                builder: (context, state) {
                  final history = state.history;
                  return Wrap(
                    spacing: double16,
                    children: List<Widget>.generate(
                      history.length,
                      (index) => CustomerChip(label: history[index]),
                    ).toList(),
                  );
                },
              ),
              HeaderSection(
                title: 'Danh mục sách',
                subtitle: 'Xem tất cả',
                onPressed: () {},
              ),
              BlocBuilder<HomeSearchBloc, HomeSearchState>(
                builder: (context, state) {
                  final listCategory = state.listCategory;
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List<Widget>.generate(
                        listCategory.length,
                        (index) =>
                            CustomerCard(categoryItem: listCategory[index]),
                      ),
                    ),
                  );
                },
              ),
              verticalSpace16,
              const HeaderSection(
                title: 'Top sách tìm kiếm nhiều nhất',
              ),
              verticalSpace16,
              BlocBuilder<HomeSearchBloc, HomeSearchState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final listBook = state.listBook;
                  return GridView.count(
                    padding: EdgeInsets.zero,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio: 2.5,
                    children: List.generate(
                      listBook.length,
                      (index) {
                        final bookItem = listBook[index];
                        return InkWell(
                          onTap: () {
                            context
                                .navigateTo(BookDetailPage(bookItem: bookItem));
                          },
                          child: BookItem(bookItem: bookItem, isGridView: true),
                        );
                      },
                    ),
                  );
                },
              ),
              verticalSpace16,
              const HeaderSection(
                title: 'Top tác giả tìm kiếm nhiều nhất',
              ),
              verticalSpace16,
              BlocBuilder<HomeSearchBloc, HomeSearchState>(
                builder: (context, state) {
                  final listAuthor = state.listAuthor;
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List<Widget>.generate(
                        listAuthor.length,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: double8),
                          child: InkWell(
                            onTap: () {},
                            child: AuthorItem(authorItem: listAuthor[index]),
                          ),
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
    });
  }
}

class CustomerChip extends StatelessWidget {
  const CustomerChip({Key? key, required this.label}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: AppColors.secondaryBackgroundColor,
      deleteIcon: const Icon(Icons.close),
      deleteIconColor: AppColors.secondaryColor,
      onDeleted: () {
        context
            .read<HomeSearchBloc>()
            .add(HomeSearchDeleteHistoryItem(name: label));
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(double8),
      ),
    );
  }
}

class CustomerCard extends StatelessWidget {
  const CustomerCard({
    Key? key,
    required this.categoryItem,
  }) : super(key: key);

  final CategoryModel categoryItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: double8),
      child: Card(
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.only(
              left: double8,
              right: double24,
              top: double12,
              bottom: double12,
            ),
            child: CategoryItem(categoryItem: categoryItem),
          ),
        ),
      ),
    );
  }
}

class MySearchDelegate extends SearchDelegate {
  final HomeSearchBloc bloc;

  MySearchDelegate({required this.bloc});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          if (query.isEmpty) {
            close(context, null);
          } else {
            query = '';
          }
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    bloc.add(HomeSearchGetRecommendedByName(name: query));

    return BlocBuilder<HomeSearchBloc, HomeSearchState>(
      bloc: bloc,
      builder: (context, state) {
        if (state.isLoading) {
          return const CircularProgressIndicator();
        }
        final listRecommendedByName = state.listRecommendedByName;
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(
              top: double16,
              left: double16,
              right: double16,
            ),
            child: Column(
              children: List<Widget>.generate(
                listRecommendedByName.length,
                (index) {
                  final item = listRecommendedByName[index];
                  if (item is BookModel) {
                    return InkWell(
                      onTap: () {
                        context.navigateTo(BookDetailPage(bookItem: item));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: double16),
                        child: BookItem(bookItem: item, isLibrary: true),
                      ),
                    );
                  }
                  if (item is AuthorModel) {
                    return InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: double16),
                        child: AuthorItem(authorItem: item, isSearch: true),
                      ),
                    );
                  }
                  return InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: double16),
                      child: CategoryItem(categoryItem: item, isSearch: true),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
