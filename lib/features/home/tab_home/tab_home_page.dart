import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/di/locator.dart';
import 'package:demo_book_reader/models/book/book_model.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/customer_box_decoration.dart';
import 'package:demo_book_reader/widgets/star_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'package:demo_book_reader/features/home/tab_home/bloc/tab_home_bloc.dart';

class TabHomePage extends StatefulWidget {
  const TabHomePage({Key? key}) : super(key: key);

  @override
  State<TabHomePage> createState() => _TabHomePageState();
}

class _TabHomePageState extends State<TabHomePage> {
  final _bloc = TabHomeBloc(bookRepository: locator<BookRepository>());

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
                  SearchBar(),
                  verticalSpace16,
                  // Reading Box
                  ReadingBookBox(percent: percent),
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
    return BlocBuilder<TabHomeBloc, TabHomeState>(
      builder: (context, state) {
        final items = state.recommendedBooks;
        final item = state.bookItem;

        return Column(
          children: [
            // Carousel
            _buildCarousel(context, items),
            verticalSpace16,
            // BookDetailCarousel
            _buildBookDetailCarousel(item),
          ],
        );
      },
    );
  }

  Container _buildBookDetailCarousel(BookModel item) {
    return Container(
      padding: const EdgeInsets.only(left: double8, right: double8, top: double12),
      decoration: CustomerBoxDecoration.buildBoxDecoration(
        color: AppColors.secondaryBackgroundColor,
        borderRadius: double8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.name,
            style: const TextStyle(
              fontSize: double16,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            children: [
              Text(
                '${item.authorName} -',
                style: TextStyle(
                  color: AppColors.secondaryColor,
                ),
              ),
              StarRating(
                rating: item.ratingTotal / item.ratingCount,
              ),
            ],
          ),
          verticalSpace4,
          Text(
            item.decription,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            // maxLines: isReadMore ? 3 : null,
            // overflow: isReadMore
            //     ? TextOverflow.ellipsis
            //     : TextOverflow.visible,
            style: TextStyle(
              color: AppColors.secondaryColor,
            ),
          ),
          // verticalSpace4,
          Row(
            children: [
              const Icon(
                Icons.remove_red_eye_outlined,
                size: 16,
              ),
              horizontalSpace8,
              Expanded(
                child: Text(
                  '${item.numberPage} lượt xem',
                  style:  TextStyle(
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
              
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  CarouselSlider _buildCarousel(BuildContext context, List<BookModel> items) {
    return CarouselSlider(
      options: CarouselOptions(
        onPageChanged: ((index, reason) {
          context
              .read<TabHomeBloc>()
              .add(TabHomeIndexCarouselChange(index: index));
        }),
        aspectRatio: 2,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.4,
      ),
      items: items
          .map(
            (item) => Container(
              margin: const EdgeInsets.only(top: double8),
              child: Image.network(item.image),
            ),
          )
          .toList(),
    );
  }
}

class ReadingBookBox extends StatelessWidget {
  const ReadingBookBox({
    Key? key,
    required this.percent,
  }) : super(key: key);

  final double percent;

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
                        const TextSpan(
                          text: 'date',
                          style: TextStyle(
                            color: AppColors.titleColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
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
          Row(
            children: [
              Flexible(
                flex: 1,
                child: Image.network(
                  'https://vn-test-11.slatic.net/p/88c8fe011aa2683f66e43efe9922dafc.jpg',
                  // scale: 2,
                ),
              ),
              horizontalSpace8,
              Flexible(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Harry Potter and the Philosopher\'s Stone',
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      'J.K. Rowling',
                      style: TextStyle(
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    const StarRating(rating: 4),
                    LinearPercentIndicator(
                      padding: const EdgeInsets.only(right: double8),
                      trailing: Text('${(percent * 100).toInt()}%'),
                      barRadius: const Radius.circular(double8),
                      // lineHeight: double8,
                      percent: percent,
                      backgroundColor: AppColors.secondaryBackgroundColor,
                      linearGradient: LinearGradient(
                        colors: <Color>[
                          AppColors.secondaryColor,
                          AppColors.primaryColor,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: CustomerBoxDecoration.buildBoxDecoration(
        color: AppColors.secondaryBackgroundColor,
        borderRadius: double24,
      ),
      child: Row(
        children: [
          horizontalSpace16,
          Icon(
            Icons.search,
            color: AppColors.secondaryColor,
          ),
          Expanded(
            child: TextField(
              style: const TextStyle(
                color: AppColors.backgroundColor,
              ),
              decoration: InputDecoration(
                hintText: 'Tìm kiếm tên sách, chủ đề, tác giả',
                border: const UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                hintStyle: TextStyle(
                  color: AppColors.secondaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Greeting extends StatelessWidget {
  const Greeting({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        Text(
          'Xin chào, Nguyen Van A',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: double24,
            color: AppColors.backgroundColor,
          ),
        ),
        verticalSpace8,
        Text(
          'Hôm nay bạn muốn đọc gì?',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.backgroundColor,
          ),
        ),
      ],
    );
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