import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/di/locator.dart';
import 'package:demo_book_reader/extensions/build_context_extensions.dart';
import 'package:demo_book_reader/features/book_detail/book_detail_page.dart';
import 'package:demo_book_reader/features/home/tab_library/bloc/tab_library_bloc.dart';
import 'package:demo_book_reader/models/user_book/user_book_model.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/customer/customer_text.dart';
import 'package:demo_book_reader/widgets/modal_item.dart';
import 'package:demo_book_reader/widgets/model_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabLibraryPage extends StatefulWidget {
  const TabLibraryPage({Key? key}) : super(key: key);

  @override
  State<TabLibraryPage> createState() => _TabLibraryPageState();
}

class _TabLibraryPageState extends State<TabLibraryPage> {
  final _bloc = TabLibraryBloc(
    bookRepository: locator<BookRepository>(),
  );

  final libraryChoice = ['Sách đang đọc', 'Sách yêu thích'];

  @override
  void initState() {
    super.initState();

    _bloc.add(TabLibraryLoaded());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Thư viện'),
          actions: [
            IconButton(
              onPressed: () {
                _buildShowModalBottomSheet(context);
              },
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
        body: _buildBody(),
      ),
    );
  }

  void _buildShowModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(double16),
          topRight: Radius.circular(double16),
        ),
      ),
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: _bloc,
          child: Builder(builder: (context) {
            return Container(
              padding: const EdgeInsets.only(
                top: double16,
                left: double16,
                right: double16,
                bottom: double24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Center(
                    child: CustomerText(
                      'Cài đặt',
                      fontSize: fontSize20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  verticalSpace32,
                  ModalItem(
                    icon: Icons.list,
                    title: 'Hiển thị theo danh sách dọc',
                    onTap: () {
                      context.off();
                      context
                          .read<TabLibraryBloc>()
                          .add(TabLibraryChangeModelShow(isGrid: false));
                    },
                  ),
                  ModalItem(
                    icon: Icons.grid_view_rounded,
                    title: 'Hiển thị theo danh sách lưới',
                    onTap: () {
                      context.off();
                      context
                          .read<TabLibraryBloc>()
                          .add(TabLibraryChangeModelShow(isGrid: true));
                    },
                  ),
                  // ModalItem(
                  //   icon: Icons.upload,
                  //   title: 'Tải sách lên',
                  //   onTap: () {
                  //     context.off();
                  //     context.navigateTo(const LibraryUploadPage());
                  //   },
                  // ),
                ],
              ),
            );
          }),
        );
      },
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: double16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<TabLibraryBloc, TabLibraryState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List<Widget>.generate(
                      libraryChoice.length,
                      (index) {
                        final isSelected = (index == state.indexChoice);
                        return CustomerChoiceChip(
                          libraryChoice: libraryChoice,
                          isSelected: isSelected,
                          index: index,
                        );
                      },
                    ),
                  ),
                );
              },
            ),
            verticalSpace8,
            BlocBuilder<TabLibraryBloc, TabLibraryState>(
              builder: (context, state) {
                late final List<UserBookModel> books;
                if (state.indexChoice == 0) {
                  books = state.readBooks;
                } else if (state.indexChoice == 1) {
                  books = state.favoriteBooks;
                }
                // else {
                //   books = state.uploadBooks;
                // }
                final isGridShow = state.isGridShow;
      
                if (isGridShow) {
                  return GridView.count(
                    padding: EdgeInsets.zero,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio: 0.5,
                    children: List.generate(
                      books.length,
                      (index) {
                        final bookItem = books[index];
                        return InkWell(
                          child: BookItem(
                            bookItem: bookItem,
                            isGridView: true,
                            isLibrary: true,
                          ),
                          onTap: () {
                            context
                                .navigateTo(BookDetailPage(bookItem: bookItem));
                          },
                        );
                      },
                    ),
                  );
                }
      
                return Column(
                  children: List<Widget>.generate(
                    books.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: double8),
                      child: InkWell(
                        child: BookItem(bookItem: books[index], isLibrary: true),
                        onTap: () {
                          context
                              .navigateTo(BookDetailPage(bookItem: books[index]));
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
     
          ],
        ),
      ),
    );
  }
}

class CustomerChoiceChip extends StatelessWidget {
  const CustomerChoiceChip({
    Key? key,
    required this.libraryChoice,
    required this.isSelected,
    required this.index,
  }) : super(key: key);

  final List<String> libraryChoice;
  final bool isSelected;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: double8),
      child: ChoiceChip(
        label: Text(libraryChoice[index]),
        selected: isSelected,
        labelStyle: TextStyle(
          color:
              isSelected ? AppColors.backgroundColor : AppColors.secondaryColor,
        ),
        selectedColor: AppColors.primaryColor,
        onSelected: ((isSelected) {
          if (isSelected) {
            context
                .read<TabLibraryBloc>()
                .add(TabLibraryChangeIndexChoice(index: index));
          }
        }),
        backgroundColor: AppColors.secondaryBackgroundColor,
      ),
    );
  }
}
