import 'package:demo_book_reader/extensions/build_context_extensions.dart';
import 'package:demo_book_reader/features/book_detail/book_detail_page.dart';
import 'package:demo_book_reader/models/book/book_model.dart';
import 'package:demo_book_reader/models/user/user_model.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/customer/customer_box_decoration.dart';
import 'package:demo_book_reader/widgets/customer/customer_linear_percent_indicator.dart';
import 'package:demo_book_reader/widgets/customer/customer_rich_text.dart';
import 'package:demo_book_reader/widgets/customer/customer_text.dart';
import 'package:demo_book_reader/widgets/model_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class UserHistoryPage extends StatelessWidget {
  const UserHistoryPage({
    Key? key,
    required this.user,
    required this.readBooks,
  }) : super(key: key);

  final UserModel user;
  final List<BookModel> readBooks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(double16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                BackButton(
                  color: AppColors.secondaryColor,
                ),
                horizontalSpace8,
                const CustomerText(
                  'Lịch sử đọc sách',
                  fontSize: fontSize20,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            verticalSpace16,
            UserBox(user: user),
            verticalSpace32,
            const CustomerText(
              'Thống kê thời lượng đọc sách mỗi ngày',
              fontSize: fontSize16,
              fontWeight: FontWeight.w500,
            ),
            verticalSpace8,
            const MySfCartesianChart(),
            verticalSpace16,
            const CustomerText(
              'Sách đã đọc',
              fontSize: fontSize16,
              fontWeight: FontWeight.w500,
            ),
            verticalSpace8,
            Column(
              children: List<Widget>.generate(
                readBooks.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: double8),
                  child: Builder(builder: (context) {
                    return InkWell(
                      child: BookItem(
                        bookItem: readBooks[index],
                        isLibrary: true,
                        isHistory: true,
                      ),
                      onTap: () {
                        context.navigateTo(
                            BookDetailPage(bookItem: readBooks[index]));
                      },
                    );
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MySfCartesianChart extends StatefulWidget {
  const MySfCartesianChart({Key? key}) : super(key: key);

  @override
  State<MySfCartesianChart> createState() => _MySfCartesianChartState();
}

class _MySfCartesianChartState extends State<MySfCartesianChart> {
  late List<ReadingTime> _chartData;
  TrackballBehavior? _trackballBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _trackballBehavior = TrackballBehavior(
        enable: true,
        // tooltipAlignment: ChartAlignment.near,
        activationMode: ActivationMode.singleTap,
        markerSettings: const TrackballMarkerSettings(
          markerVisibility: TrackballVisibilityMode.visible,
        ),
        lineColor: AppColors.primaryColor.withOpacity(0.3),
        lineWidth: 2,
        builder: (BuildContext context, TrackballDetails trackballDetails) {
          int readingTime = trackballDetails.point!.yValue.round();
          String? dateFormat;
          for (int i = 0; i < _chartData.length; i++) {
            if (trackballDetails.pointIndex == i) {
              dateFormat = DateFormat('dd/MM/yyyy').format(_chartData[i].date);
            }
          }
          return Container(
            height: double60,
            padding: const EdgeInsets.symmetric(horizontal: double12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(double12),
              color: AppColors.titleColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomerText(
                  '$dateFormat',
                  color: AppColors.secondaryColor,
                ),
                verticalSpace4,
                CustomerText(
                  '$readingTime phút',
                  color: AppColors.backgroundColor,
                ),
              ],
            ),
          );
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: NumericAxis(
        majorGridLines: const MajorGridLines(width: 0),
      ),
      primaryYAxis: NumericAxis(
        majorGridLines: const MajorGridLines(width: 0),
      ),
      onMarkerRender: (MarkerRenderArgs args) {
        args.markerHeight = 0;
        args.markerWidth = 0;
      },
      trackballBehavior: _trackballBehavior,
      series: <ChartSeries>[
        SplineSeries<ReadingTime, double>(
          color: AppColors.primaryColor,
          splineType: SplineType.natural,
          name: 'Reading Time',
          dataSource: _chartData,
          xValueMapper: (ReadingTime data, _) =>
              double.parse(DateFormat('dd').format(data.date)),
          yValueMapper: (ReadingTime data, _) => data.time,
          enableTooltip: true,
          markerSettings: const MarkerSettings(
            isVisible: true,
          ),
        ),
      ],
    );
  }
}

class UserBox extends StatelessWidget {
  const UserBox({
    Key? key,
    required this.user,
  }) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(double16),
      decoration: CustomerBoxDecoration.buildBoxDecoration(
        color: AppColors.secondaryBackgroundColor,
        borderRadius: double16,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 4,
            child: Image.network(user.imagaLinkRanking),
          ),
          Flexible(
            flex: 9,
            child: Column(
              children: [
                Row(
                  children: [
                    const CustomerText(
                      'GOLD',
                      fontWeight: FontWeight.w500,
                    ),
                    horizontalSpace8,
                    CustomerText(
                      'Tháng 12/2022',
                      color: AppColors.secondaryColor,
                    ),
                  ],
                ),
                verticalSpace8,
                CustomerRichText(
                  text:
                      'Chúc mừng ${user.lastName} ${user.firstName} đã đạt được HẠNG VÀNG tháng 12 nhờ đọc ',
                  subText: '2000 phút',
                  color: AppColors.titleColor,
                  subColor: AppColors.primaryColor,
                ),
                verticalSpace4,
                const CustomerLinearPercentIndicator(
                  percent: 0.3,
                  isUser: true,
                ),
                verticalSpace4,
                CustomerText(
                  'Đọc thêm 450 phút nữa để thăng hạng nhé',
                  color: AppColors.primaryColor,
                  isEllipsis: false,
                  fontSize: fontSize12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<ReadingTime> getChartData() {
  final List<ReadingTime> chartData = [
    ReadingTime(80, DateTime(2022, 12, 12)),
    ReadingTime(70, DateTime(2022, 12, 13)),
    ReadingTime(60, DateTime(2022, 12, 14)),
    ReadingTime(90, DateTime(2022, 12, 15)),
    ReadingTime(20, DateTime(2022, 12, 16)),
    ReadingTime(20, DateTime(2022, 12, 17)),
    ReadingTime(60, DateTime(2022, 12, 18)),
    ReadingTime(90, DateTime(2022, 12, 19)),
    ReadingTime(20, DateTime(2022, 12, 20)),
    ReadingTime(20, DateTime(2022, 12, 21)),
  ];
  return chartData;
}

class ReadingTime {
  ReadingTime(this.time, this.date);
  final double time;
  final DateTime date;
}
