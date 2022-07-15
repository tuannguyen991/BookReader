import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/di/locator.dart';
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
                  // BlocBuilder<TabHomeBloc, TabHomeState>(
                  //   builder: (context, state) {
                  //     return Column(
                  //       children: [
                  //         TextButton(
                  //           onPressed: () {
                  //             context.read<TabHomeBloc>().add(TabHomeLoadedTest());
                  //           },
                  //           child: const Text('Click'),
                  //         ),
                  //         Text(state.hello),
                  //         Image.network(state.hellotest),
                  //       ],
                  //     );
                  //   },
                  // ),
                  // BookDetailCarousel(
                  //   author: authors[_current],
                  //   description: descriptions[_current],
                  //   rating: ratings[_current],
                  //   title: titles[_current],
                  //   view: views[_current],
                  // ),
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
        final itemBook = items[state.indexCarousel];
        return Column(
          children: [
            // Carousel
            CarouselSlider(
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
            ),
            verticalSpace16,
            // BookDetailCarousel
            Container(
              padding: const EdgeInsets.all(double8),
              decoration: CustomerBoxDecoration.buildBoxDecoration(
                color: AppColors.secondaryBackgroundColor,
                borderRadius: double8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemBook.name,
                    style: const TextStyle(
                      fontSize: double16,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${itemBook.authorName} -',
                        style: TextStyle(
                          color: AppColors.secondaryColor,
                        ),
                      ),
                      StarRating(
                        rating: itemBook.ratingTotal / itemBook.ratingCount,
                      ),
                    ],
                  ),
                  verticalSpace8,
                  Text(
                    itemBook.decription,
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
                  // const SizedBox(
                  //   height: sizeBoxWidth,
                  // ),
                  // Row(
                  //   children: [
                  //     const Icon(
                  //       Icons.remove_red_eye_outlined,
                  //       size: 16,
                  //     ),
                  //     const SizedBox(width: sizeBoxWidth),
                  //     Expanded(
                  //       child: Text(
                  //         '${widget.view} lượt xem',
                  //         style: const TextStyle(
                  //           color: iconColor,
                  //         ),
                  //       ),
                  //     ),
                  //     TextButton(
                  //       child: Text(
                  //         textButton,
                  //         style: const TextStyle(
                  //           color: primaryAppColor,
                  //           fontSize: sizeTitle * 0.8,
                  //         ),
                  //       ),
                  //       onPressed: () {
                  //         setState(() {
                  //           isReadMore = !isReadMore;
                  //           textButton = isReadMore ? 'Xem thêm' : 'Ẩn bớt';
                  //         });
                  //       },
                  //     )
                  //   ],
                  // ),
                ],
              ),
            )
          ],
        );
      },
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

// class BookDetailCarousel extends StatefulWidget {
//   const BookDetailCarousel(
//       {Key? key,
//       required this.title,
//       required this.author,
//       required this.rating,
//       required this.view,
//       required this.description})
//       : super(key: key);

//   final String title;
//   final String author;
//   final double rating;
//   final int view;
//   final String description;

//   @override
//   State<BookDetailCarousel> createState() => _BookDetailCarouselState();
// }

// class _BookDetailState extends State<BookDetail> {
//   bool isReadMore = true;
//   String textButton = 'Xem thêm';

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(edgeInsets / 2),
//       decoration: BoxDecoration(
//         color: const Color(0xFFF8F9FB),
//         borderRadius: BorderRadius.circular(borderRadius / 2.5),
//       ),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 child: Text(
//                   widget.title,
//                   style: const TextStyle(
//                     fontSize: sizeTitle,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//               ),
//               const Icon(Icons.more_horiz_outlined)
//             ],
//           ),
//           Row(
//             children: [
//               Text(
//                 '${widget.author} -',
//                 style: const TextStyle(
//                   color: iconColor,
//                 ),
//               ),
//               StarRating(
//                 rating: widget.rating,
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: sizeBoxWidth,
//           ),
//           Text(
//             widget.description,
//             maxLines: isReadMore ? 3 : null,
//             overflow: isReadMore ? TextOverflow.ellipsis : TextOverflow.visible,
//             style: const TextStyle(
//               color: iconColor,
//             ),
//           ),
//           const SizedBox(
//             height: sizeBoxWidth,
//           ),
//           Row(
//             children: [
//               const Icon(
//                 Icons.remove_red_eye_outlined,
//                 size: 16,
//               ),
//               const SizedBox(width: sizeBoxWidth),
//               Expanded(
//                 child: Text(
//                   '${widget.view} lượt xem',
//                   style: const TextStyle(
//                     color: iconColor,
//                   ),
//                 ),
//               ),
//               TextButton(
//                 child: Text(
//                   textButton,
//                   style: const TextStyle(
//                     color: primaryAppColor,
//                     fontSize: sizeTitle * 0.8,
//                   ),
//                 ),
//                 onPressed: () {
//                   setState(() {
//                     isReadMore = !isReadMore;
//                     textButton = isReadMore ? 'Xem thêm' : 'Ẩn bớt';
//                   });
//                 },
//               )
//             ],
//           ),
//         ],
//       ),
//     );
 
 
//   }
// }

