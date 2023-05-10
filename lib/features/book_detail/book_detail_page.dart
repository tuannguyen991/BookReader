import 'dart:convert';

import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/data/repository/user_repository.dart';
import 'package:demo_book_reader/di/locator.dart';
import 'package:demo_book_reader/features/book_detail/bloc/book_detail_bloc.dart';
import 'package:demo_book_reader/features/home/tab_user/user_reading_package/user_reading_package.dart';
import 'package:demo_book_reader/features/login/login_page.dart';
import 'package:demo_book_reader/models/user_book/user_book_model.dart';
import 'package:demo_book_reader/share/extensions/build_context_extensions.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/customer/customer_readmore.dart';
import 'package:demo_book_reader/widgets/customer/customer_text.dart';
import 'package:demo_book_reader/widgets/header_section.dart';
import 'package:demo_book_reader/widgets/image_background.dart';
import 'package:demo_book_reader/widgets/model_item.dart';
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
  final _bloc = BookDetailBloc(
      bookRepository: locator<BookRepository>(),
      userRepository: locator<UserRepository>());

  late DateTime _startTime;

  @override
  void initState() {
    super.initState();

    _startTime = DateTime.now();

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
        ImageBackground(context: context, imageLink: bookItem.imageLink),
        Padding(
          padding: const EdgeInsets.only(
              top: double88, left: double16, right: double16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<BookDetailBloc, BookDetailState>(
                builder: (context, state) {
                  return BookItem(bookItem: state.bookItem, isBookDetail: true);
                },
              ),
              verticalSpace16,
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: double80),
                  child: Column(
                    children: [
                      CustomerReadMoreText(text: bookItem.description),
                      HeaderSection(
                        title: 'Cùng danh mục',
                        subtitle: 'Xem tất cả',
                        onPressed: () {},
                      ),
                      BlocBuilder<BookDetailBloc, BookDetailState>(
                        builder: (context, state) {
                          if (state.isLoading) {
                            return const Center(
                                child: CircularProgressIndicator());
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
                                    bookItem:
                                        UserBookModel.fromBookModel(bookItem),
                                    isGridView: true,
                                  ),
                                  onTap: () {
                                    if (state.isLogin) {
                                      final endTime = DateTime.now();
                                      final duration =
                                          endTime.difference(_startTime);
                                      _bloc.add(
                                          BookDetailHistory(time: duration));
                                    }

                                    context.navigateOff(
                                      BookDetailPage(
                                        bookItem: UserBookModel.fromBookModel(
                                          bookItem,
                                        ),
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
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: BlocBuilder<BookDetailBloc, BookDetailState>(
            builder: (context, state) {
              return BottomButton(bookItem: state.bookItem, bloc: _bloc);
            },
          ),
        ),
        Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: AppBar(
            leading: GestureDetector(
              onTap: () {
                final endTime = DateTime.now();
                final duration = endTime.difference(_startTime);
                _bloc.add(BookDetailHistory(time: duration));

                context.off();
              },
              child: const Icon(Icons.arrow_back),
            ),
            foregroundColor: AppColors.secondaryColor,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
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
    required this.bloc,
  }) : super(key: key);

  // final bool isRead;
  final UserBookModel bookItem;
  final BookDetailBloc bloc;

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
                      if (!state.isLogin) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text(
                              'Bạn chưa đăng nhập',
                            ),
                            content: const Text(
                              'Vui lòng Đăng nhập để sử dụng đầy đủ tính năng',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  context.off();
                                },
                                child: const Text('Quay lại'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  context.off();
                                  context.navigateOff(const LoginPage());
                                },
                                child: const Text('Đăng nhập'),
                              ),
                            ],
                          ),
                        );
                        return;
                      }
                      bloc.add(BookDetailReading(
                          onSuccess: () async {
                            VocsyEpub.setConfig(
                              themeColor: AppColors.primaryColor,
                              identifier: 'iosBook',
                              scrollDirection:
                                  EpubScrollDirection.ALLDIRECTIONS,
                              allowSharing: true,
                              enableTts: true,
                              nightMode: false,
                            );

                            // get current locator
                            VocsyEpub.locatorStream.listen((locator) {
                              context.read<BookDetailBloc>().add(
                                    BookDetailSaveLocator(
                                        locatorString: locator),
                                  );
                            });

                            VocsyEpub.highLightStream.listen((highlight) {
                              context.read<BookDetailBloc>().add(
                                    BookDetailHighLight(highLight: highlight),
                                  );
                            });

                            var locator = state.locatorString != null
                                ? EpubLocator.fromJson(
                                    jsonDecode(state.locatorString!))
                                : null;

                            var highLights = state.highLights;

                            await VocsyEpub.openAsset(
                              'assets/epub/${bookItem.bookId}.epub',
                              lastLocation: locator,
                              highLights: highLights,
                            );
                          },
                          onFailed: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  // title: const Text('AlertDialog Title'),
                                  content: const Text(
                                      'Vui lòng đăng ký để trải nghiệm đầy đủ tính năng trên ứng dụng BookReader'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => context.off(),
                                      child: const Text('Đóng'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        context.off();
                                        context.navigateTo(UserReadingPackage(
                                            user: state.user));
                                      },
                                      child: const Text('Đăng ký'),
                                    ),
                                  ],
                                ),
                              )));
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
                    if (!state.isLogin) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text(
                            'Bạn chưa đăng nhập',
                          ),
                          content: const Text(
                            'Vui lòng Đăng nhập để sử dụng đầy đủ tính năng',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                context.off();
                              },
                              child: const Text('Quay lại'),
                            ),
                            TextButton(
                              onPressed: () async {
                                context.off();
                                context.navigateOff(const LoginPage());
                              },
                              child: const Text('Đăng nhập'),
                            ),
                          ],
                        ),
                      );
                      return;
                    }
                    context.read<BookDetailBloc>().add(
                          BookDetailFavoriteChange(bookId: bookItem.bookId),
                        );
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
