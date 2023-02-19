import 'dart:convert';

import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/di/locator.dart';
import 'package:demo_book_reader/extensions/build_context_extensions.dart';
import 'package:demo_book_reader/features/book_detail/bloc/book_detail_bloc.dart';
import 'package:demo_book_reader/models/user_book/user_book_model.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/customer/customer_text.dart';
import 'package:demo_book_reader/widgets/model_item.dart';
import 'package:demo_book_reader/widgets/customer/customer_readmore.dart';
import 'package:demo_book_reader/widgets/header_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocsy_epub_viewer/epub_viewer.dart';

class BookDetailPage extends StatefulWidget {
  const BookDetailPage({
    Key? key,
    required this.bookItem,
  }) : super(key: key);

  final UserBookModel bookItem;

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  final _bloc = BookDetailBloc(bookRepository: locator<BookRepository>());

  @override
  void initState() {
    super.initState();

    _bloc.add(BookDetailLoaded(bookItem: widget.bookItem));
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
    final bookItem = widget.bookItem;

    return Stack(
      children: <Widget>[
        ImageBackground(context: context, bookItem: bookItem),
        SingleChildScrollView(
          padding: const EdgeInsets.only(
              top: double88, left: double16, right: double16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BookItem(bookItem: bookItem, isBookDetail: true),
              verticalSpace16,
              CustomerReadMoreText(text: bookItem.description),
              HeaderSection(
                title: 'Cùng danh mục',
                subtitle: 'Xem tất cả',
                onPressed: () {},
              ),
              BlocBuilder<BookDetailBloc, BookDetailState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return GridView.count(
                    padding: EdgeInsets.zero,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio: 2.5,
                    children: List.generate(
                      state.sameCategoryBooks.length,
                      (index) {
                        final bookItem = state.sameCategoryBooks[index];
                        return InkWell(
                          child: BookItem(
                            bookItem: UserBookModel.fromBookModel(bookItem),
                            isGridView: true,
                          ),
                          onTap: () {
                            context.navigateTo(
                              BookDetailPage(
                                bookItem: UserBookModel.fromBookModel(bookItem),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: BottomButton(bookItem: bookItem),
        ),
        const Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: CustomerAppBar(
              // bookItem: widget.bookItem,
              ),
        ),
      ],
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    // required this.isRead,
    required this.bookItem,
  }) : super(key: key);

  // final bool isRead;
  final UserBookModel bookItem;
  @override
  Widget build(BuildContext context) {
    final isRead = bookItem.numberOfReadPages != 0;
    return BlocBuilder<BookDetailBloc, BookDetailState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(double16),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                    onPressed: () async {
                      VocsyEpub.setConfig(
                        themeColor: AppColors.primaryColor,
                        identifier: 'iosBook',
                        scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
                        allowSharing: true,
                        enableTts: true,
                        nightMode: false,
                      );
                      // get current locator
                      VocsyEpub.locatorStream.listen((locator) {
                        print('LOCATOR Rick: ${locator}');
                      });
                      await VocsyEpub.openAsset('assets/epub/0X1PxwEACAAJ.epub',
                          // lastLocation: locator
                          lastLocation: EpubLocator.fromJson({
                            'bookId': 'http://www.gutenberg.org/ebooks/768',
                            'href': '/OEBPS/@public@vhost@g@gutenberg@html@files@768@768-h@768-h-0.htm.html',
                            'created': 1676811241622,
                            'locations': {'cfi': 'epubcfi(/0!/4/42/1:0)'}
                          }),
                          );
                    },
                    child: CustomerText(
                      isRead ? 'Đọc tiếp' : 'Đọc sách ngay',
                      fontSize: fontSize16,
                    )),
              ),
              horizontalSpace8,
              Container(
                decoration: BoxDecoration(
                  color: AppColors.secondaryBackgroundColor,
                  borderRadius: BorderRadius.circular(double8),
                ),
                child: IconButton(
                  icon: Icon(
                    state.isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border_outlined,
                    color: AppColors.primaryColor,
                  ),
                  onPressed: () {
                    // context.read<BookDetailBloc>().add(
                    //       BookDetailFavoriteChange(bookItem: bookItem),
                    //     );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ImageBackground extends StatelessWidget {
  const ImageBackground({
    Key? key,
    required this.context,
    required this.bookItem,
  }) : super(key: key);

  final BuildContext context;
  final UserBookModel bookItem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Image.network(
        bookItem.imageLink,
        fit: BoxFit.cover,
        color: const Color.fromRGBO(255, 255, 255, 0.075),
        colorBlendMode: BlendMode.modulate,
      ),
    );
  }
}

class CustomerAppBar extends StatelessWidget {
  const CustomerAppBar({
    Key? key,
    // required this.bookItem,
  }) : super(key: key);

  // final BookModel bookItem;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: AppColors.secondaryColor,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }
}
