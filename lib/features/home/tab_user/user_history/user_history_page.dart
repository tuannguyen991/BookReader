import 'package:demo_book_reader/features/book_detail/book_detail_page.dart';
import 'package:demo_book_reader/features/home/tab_user/main/util/personal_option_list.dart';
import 'package:demo_book_reader/models/user/user_model.dart';
import 'package:demo_book_reader/models/user_book/user_book_model.dart';
import 'package:demo_book_reader/models/user_history/user_history_model.dart';
import 'package:demo_book_reader/share/extensions/build_context_extensions.dart';
import 'package:demo_book_reader/share/extensions/ranking_extension.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/customer/custom_appbar.dart';
import 'package:demo_book_reader/widgets/customer/customer_box_decoration.dart';
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
  final List<UserBookModel> readBooks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomAppBarTitle(text: userHistoryText),
      ),
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
            UserBox(user: user),
            verticalSpace32,
            const CustomerText(
              'Thống kê thời lượng đọc sách mỗi ngày',
              fontSize: fontSize16,
              fontWeight: FontWeight.w500,
            ),
            verticalSpace8,
            MySfCartesianChart(chartData: user.recentlyHistories),
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
  const MySfCartesianChart({
    Key? key,
    required this.chartData,
  }) : super(key: key);

  final List<UserHistoryModel> chartData;

  @override
  State<MySfCartesianChart> createState() => _MySfCartesianChartState();
}

class _MySfCartesianChartState extends State<MySfCartesianChart> {
  late List<UserHistoryModel> _chartData;
  TrackballBehavior? _trackballBehavior;

  @override
  void initState() {
    _chartData = widget.chartData;

    // _bloc.add(UserHistoryLoaded());

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
              dateFormat = DateFormat('dd/MM/yyyy').format(_chartData[i].date!);
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
      primaryXAxis: DateTimeAxis(
        majorGridLines: const MajorGridLines(width: 0),
        labelFormat: '{value}',
      ),
      primaryYAxis: NumericAxis(
        majorGridLines: const MajorGridLines(width: 0),
        labelFormat: '{value} phút',
      ),
      onMarkerRender: (MarkerRenderArgs args) {
        args.markerHeight = 0;
        args.markerWidth = 0;
      },
      trackballBehavior: _trackballBehavior,
      series: <ChartSeries>[
        SplineSeries<UserHistoryModel, DateTime>(
          dataLabelSettings: const DataLabelSettings(isVisible: true),
          color: AppColors.primaryColor,
          splineType: SplineType.natural,
          name: 'Reading Time',
          dataSource: _chartData,
          xValueMapper: (UserHistoryModel data, _) => data.date!,
          yValueMapper: (UserHistoryModel data, _) => data.readingTime,
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
            child: Image.asset(user.ranking.image),
          ),
          Flexible(
            flex: 9,
            child: Column(
              children: [
                Row(
                  children: [
                    CustomerText(
                      user.ranking.name,
                      fontWeight: FontWeight.w500,
                    ),
                    horizontalSpace8,
                  ],
                ),
                verticalSpace8,
                CustomerRichText(
                  text:
                      'Chúc mừng ${user.lastName} ${user.firstName} đã đạt được ',
                  subText: user.ranking.name,
                  color: AppColors.titleColor,
                  subColor: AppColors.primaryColor,
                ),
                verticalSpace20,
                CustomerRichText(
                  text: 'Bạn đã đọc sách được ',
                  subText: '${user.totalReadingTime} phút',
                  color: AppColors.titleColor,
                  subColor: AppColors.primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReadingTime {
  ReadingTime(this.time, this.date);

  final double time;
  final DateTime date;
}
