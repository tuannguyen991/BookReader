import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/data/repository/user_repository.dart';
import 'package:demo_book_reader/di/locator.dart';
import 'package:demo_book_reader/features/book_detail/book_detail_page.dart';
import 'package:demo_book_reader/features/home/tab_home/bloc/tab_home_bloc.dart';
import 'package:demo_book_reader/models/book/book_model.dart';
import 'package:demo_book_reader/models/user_book/user_book_model.dart';
import 'package:demo_book_reader/share/extensions/build_context_extensions.dart';
import 'package:demo_book_reader/share/functions/util_func.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/backdrop.dart';
import 'package:demo_book_reader/widgets/background_image.dart';
import 'package:demo_book_reader/widgets/customer/customer_box_decoration.dart';
import 'package:demo_book_reader/widgets/customer/customer_clip_rrect.dart';
import 'package:demo_book_reader/widgets/customer/customer_rich_text.dart';
import 'package:demo_book_reader/widgets/customer/customer_text.dart';
import 'package:demo_book_reader/widgets/greeting.dart';
import 'package:demo_book_reader/widgets/model_item.dart';
import 'package:demo_book_reader/widgets/search_bar.dart';
import 'package:demo_book_reader/widgets/star_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class TabHomePage extends StatefulWidget {
  const TabHomePage({Key? key}) : super(key: key);

  @override
  State<TabHomePage> createState() => _TabHomePageState();
}

class _TabHomePageState extends State<TabHomePage> {
  final _bloc = TabHomeBloc(
    bookRepository: locator<BookRepository>(),
    userRepository: locator<UserRepository>(),
  );

  @override
  void initState() {
    super.initState();

    _bloc.add(TabHomeLoaded());
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
    const percent = 0.35; // percent distance from Top_Screen to Back_Drop
    return Stack(
      children: [
        BackgroundImage(context: context),
        Backdrop(context: context, percent: percent),
        SingleChildScrollView(
          child: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(
                top: double16,
                left: double16,
                right: double16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<TabHomeBloc, TabHomeState>(
                    builder: (context, state) {
                      return Greeting(user: state.user);
                    },
                  ),
                  verticalSpace32,
                  const SearchBar(isTextInput: false),
                  verticalSpace16,

                  /// Reading Box
                  BlocBuilder<TabHomeBloc, TabHomeState>(
                    builder: (context, state) {
                      if (state.isLoading) {
                        return const CircularProgressIndicator();
                      }
                      final lastBook = state.lastBook;
                      if (lastBook == null) {
                        return RecommendBookBox(
                            book: state.recommendedBooks.first);
                      }
                      return ReadingBookBox(lastBook: lastBook);
                    },
                  ),
                  verticalSpace16,
                  const CustomerText(
                    'Gợi ý sách cho bạn',
                    fontSize: fontSize16,
                    fontWeight: FontWeight.w500,
                  ),
                  const RecommendedCarousel(),
                  verticalSpace8
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class RecommendedCarousel extends StatelessWidget {
  const RecommendedCarousel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Carousel
        _buildCarousel(),
        verticalSpace16,

        /// BookDetailCarousel
        _buildBookDetailCarousel(),
      ],
    );
  }

  Widget _buildBookDetailCarousel() {
    return BlocBuilder<TabHomeBloc, TabHomeState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        final item = state.bookItem;

        /// limit number of authors
        final String authors = limitCharacters(list: item.authors, limit: 20);

        return Container(
          padding: const EdgeInsets.only(
              left: double8, right: double8, top: double12),
          decoration: CustomerBoxDecoration.buildBoxDecoration(
            color: AppColors.secondaryBackgroundColor,
            borderRadius: double8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomerText(
                item.title,
                fontSize: fontSize16,
              ),
              Row(
                children: [
                  CustomerText(
                    '$authors - ',
                    color: AppColors.secondaryColor,
                  ),
                  StarRating(
                    rating: item.averageRating,
                  ),
                ],
              ),
              CustomerText(
                item.description,
                maxLines: 2,
                color: AppColors.secondaryColor,
              ),
              Row(
                children: [
                  // const Icon(
                  //   Icons.remove_red_eye_outlined,
                  //   size: 16,
                  // ),
                  horizontalSpace8,
                  Expanded(
                    child: CustomerText(
                      // '${'item.view'} lượt xem',
                      ' ',
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  TextButton(
                    child: CustomerText(
                      'Xem thêm',
                      color: AppColors.primaryColor,
                      fontSize: fontSize16,
                    ),
                    onPressed: () {
                      context.navigateTo(
                        BookDetailPage(
                            bookItem: UserBookModel.fromBookModel(item)),
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCarousel() {
    return BlocBuilder<TabHomeBloc, TabHomeState>(
      buildWhen: (previous, current) {
        return previous.recommendedBooks != current.recommendedBooks;
      },
      builder: (context, state) {
        final items = state.recommendedBooks;
        return CarouselSlider(
          options: CarouselOptions(
            onPageChanged: ((index, reason) {
              context
                  .read<TabHomeBloc>()
                  .add(TabHomeIndexCarouselChange(index: index));
            }),
            aspectRatio: 2,
            enlargeCenterPage: true,
            viewportFraction: 0.4,
          ),
          items: items
              .map(
                (item) => Container(
                  margin: const EdgeInsets.only(top: double8),
                  child: CustomerClipRRect(image: item.imageLink),
                ),
              )
              .toList(),
        );
      },
    );
  }
}

class ReadingBookBox extends StatelessWidget {
  const ReadingBookBox({
    Key? key,
    required this.lastBook,
  }) : super(key: key);

  final UserBookModel lastBook;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(double8),
      decoration: CustomerBoxDecoration.buildBoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: double16,
        isShadow: true,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(double12),
            decoration: CustomerBoxDecoration.buildBoxDecoration(
              color: AppColors.secondaryBackgroundColor,
              borderRadius: double16,
            ),
            child: Row(
              children: [
                Expanded(
                  child: CustomerRichText(
                    text:
                        'Bạn đang đọc dở quyển sách này tại lần cuối truy cập ngày ',
                    subText:
                        DateFormat('dd/MM/yyyy').format(lastBook.lastRead!),
                    color: AppColors.secondaryColor,
                    subColor: AppColors.titleColor,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.navigateTo(BookDetailPage(
                      bookItem: lastBook,
                    ));
                  },
                  child: CustomerText(
                    'Đọc tiếp',
                    color: AppColors.primaryColor,
                    fontSize: fontSize16,
                  ),
                ),
              ],
            ),
          ),
          verticalSpace8,
          BookItem(bookItem: lastBook),
        ],
      ),
    );
  }
}

class RecommendBookBox extends StatelessWidget {
  const RecommendBookBox({
    Key? key,
    required this.book,
  }) : super(key: key);

  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(double8),
      decoration: CustomerBoxDecoration.buildBoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: double16,
        isShadow: true,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(double12),
            decoration: CustomerBoxDecoration.buildBoxDecoration(
              color: AppColors.secondaryBackgroundColor,
              borderRadius: double16,
            ),
            child: Row(
              children: [
                Expanded(
                  child: CustomerRichText(
                    text: 'Sách có thể bạn muốn đọc',
                    subText: '',
                    // DateFormat('dd/MM/yyyy').format(lastBook.lastRead!),
                    color: AppColors.secondaryColor,
                    subColor: AppColors.titleColor,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.navigateTo(BookDetailPage(
                      bookItem: UserBookModel.fromBookModel(book),
                    ));
                  },
                  child: CustomerText(
                    'Đọc ngay',
                    color: AppColors.primaryColor,
                    fontSize: fontSize16,
                  ),
                ),
              ],
            ),
          ),
          verticalSpace8,
          BookItem(bookItem: UserBookModel.fromBookModel(book)),
        ],
      ),
    );
  }
}
