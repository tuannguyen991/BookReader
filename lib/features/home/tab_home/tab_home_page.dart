import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/data/repository/user_repository.dart';
import 'package:demo_book_reader/di/locator.dart';
import 'package:demo_book_reader/extensions/build_context_extensions.dart';
import 'package:demo_book_reader/features/book_detail/book_detail_page.dart';
import 'package:demo_book_reader/models/book/book_model.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/book_item.dart';
import 'package:demo_book_reader/widgets/customer/customer_box_decoration.dart';
import 'package:demo_book_reader/widgets/customer/customer_clip_rrect.dart';
import 'package:demo_book_reader/widgets/search_bar.dart';
import 'package:demo_book_reader/widgets/star_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:demo_book_reader/features/home/tab_home/bloc/tab_home_bloc.dart';

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
    // percent distance from Top_Screen to Back_Drop
    const percent = 0.35;
    return Stack(
      children: [
        BackGroundImage(context: context),
        BackDrop(context: context, percent: percent),
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
                children: const [
                  Greeting(),
                  verticalSpace32,
                  SearchBar(isTextInput: false),
                  verticalSpace16,
                  // Reading Box
                  ReadingBookBox(),
                  verticalSpace16,
                  Text(
                    'Gợi ý sách cho bạn',
                    style: TextStyle(
                      fontSize: double16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  RecommendedCarousel(),
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
        // Carousel
        _buildCarousel(),
        verticalSpace16,
        // BookDetailCarousel
        _buildBookDetailCarousel(),
      ],
    );
    //   },
    // );
  }

  Widget _buildBookDetailCarousel() {
    return BlocBuilder<TabHomeBloc, TabHomeState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const CircularProgressIndicator();
        }

        final item = state.bookItem;

        // limit number of authors
        final String authors =
            limitCharacters(list: item.authorList, limit: 32);

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
              Text(
                item.title,
                style: const TextStyle(
                  fontSize: double16,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  Text(
                    '$authors - ',
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  StarRating(
                    rating: item.averageRating,
                  ),
                ],
              ),
              Text(
                item.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppColors.secondaryColor,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.remove_red_eye_outlined,
                    size: 16,
                  ),
                  horizontalSpace8,
                  Expanded(
                    child: Text(
                      '${item.view} lượt xem',
                      style: TextStyle(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ),
                  TextButton(
                    child: Text(
                      'Xem thêm',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: double16,
                      ),
                    ),
                    onPressed: () {
                      context.navigateTo(BookDetailPage(bookItem: item));
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

  String limitCharacters({required List<dynamic> list, required int limit}) {
    if (list.join(',').length <= limit) {
      return list.join(', ');
    } else {
      if (list.length == 1) {
        return '${list.first.toString().substring(0, limit)} ...';
      } else if (list.length == 2) {
        return '${list.first.toString()}, ...';
      } else if (list.getRange(0, 2).toList().join(', ').length < limit) {
        return '${list.getRange(0, 2).toList().join(', ')}, ...';
      } else {
        return '${list.first.toString()}, ...';
      }
    }
  }

  Widget _buildCarousel() {
    return BlocBuilder<TabHomeBloc, TabHomeState>(
      buildWhen: (previous, current) {
        return previous.recommendedBooks != current.recommendedBooks;
      },
      builder: (context, state) {
        final items = state.recommendedBooks;
        // print('carousel');
        return CarouselSlider(
          options: CarouselOptions(
            onPageChanged: ((index, reason) {
              context
                  .read<TabHomeBloc>()
                  .add(TabHomeIndexCarouselChange(index: index));
            }),
            aspectRatio: 2,
            // autoPlay: true,
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabHomeBloc, TabHomeState>(
      builder: (context, state) {
        final BookModel lastBook = state.lastBook;
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
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  'Bạn đang đọc dở quyển sách này tại lần cuối truy cập ngày ',
                              style: TextStyle(
                                color: AppColors.secondaryColor,
                              ),
                            ),
                            TextSpan(
                              text: lastBook.lastDay,
                              style: const TextStyle(
                                color: AppColors.titleColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.navigateTo(BookDetailPage(bookItem: lastBook));
                      },
                      child: Text(
                        'Đọc tiếp',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: double16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace8,
              Builder(builder: (context) {
                if (state.isLoading) {
                  return const CircularProgressIndicator();
                }
                return BookItem(bookItem: lastBook);
              }),
            ],
          ),
        );
      },
    );
  }
}

class Greeting extends StatelessWidget {
  const Greeting({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabHomeBloc, TabHomeState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Xin chào, ${state.firstName}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: double24,
              color: AppColors.backgroundColor,
            ),
          ),
          verticalSpace8,
          const Text(
            'Hôm nay bạn muốn đọc gì?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.backgroundColor,
            ),
          ),
        ],
      );
    });
  }
}

class BackDrop extends StatelessWidget {
  const BackDrop({
    Key? key,
    required this.context,
    required this.percent,
  }) : super(key: key);

  final BuildContext context;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * percent,
      left: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: CustomerBoxDecoration.buildBoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: double45,
        ),
      ),
    );
  }
}

class BackGroundImage extends StatelessWidget {
  const BackGroundImage({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Image.network(
        'https://cdn.pixabay.com/photo/2016/08/24/16/20/books-1617327_960_720.jpg',
        fit: BoxFit.fill,
        color: AppColors.primaryColor.withOpacity(1),
        colorBlendMode: BlendMode.modulate,
      ),
    );
  }
}
