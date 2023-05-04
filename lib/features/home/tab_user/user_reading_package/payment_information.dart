import 'package:demo_book_reader/data/repository/payment_repository.dart';
import 'package:demo_book_reader/di/locator.dart';
import 'package:demo_book_reader/features/home/tab_user/user_reading_package/confirm_payment.dart';
import 'package:demo_book_reader/models/reading_package/reading_package_model.dart';
import 'package:demo_book_reader/share/enum/button_type.dart';
import 'package:demo_book_reader/share/extensions/build_context_extensions.dart';
import 'package:demo_book_reader/share/functions/util_func.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/customer/custom_appbar.dart';
import 'package:demo_book_reader/widgets/customer/custom_button.dart';
import 'package:demo_book_reader/widgets/customer/customer_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaymentModal extends StatefulWidget {
  final bool? isUsing;
  final ReadingPackageModel package;
  final DateTime? endDate;
  final Function callback;

  const PaymentModal(
      {Key? key,
      required this.package,
      this.endDate,
      this.isUsing = false,
      required this.callback})
      : super(key: key);

  @override
  State<PaymentModal> createState() => _PaymentModalState();
}

class _PaymentModalState extends State<PaymentModal> {
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  int selected = 0;
  List<Map> paymentMethods = [
    {'name': 'Ví ZaloPay', 'image': 'assets/image/zalopay.png'},
    {'name': 'Ví MoMo', 'image': 'assets/image/momo.png'},
    {'name': 'Chuyển khoản qua ngân hàng', 'image': 'assets/image/bank.png'}
  ];
  final textStyle = const TextStyle(color: Colors.black54);
  final valueStyle = TextStyle(
      color: AppColors.primaryColor,
      fontSize: 18.0,
      fontWeight: FontWeight.w400);
  String zpTransToken = '';
  String payResult = '';
  double price = 0;
  bool showResult = false;
  final PaymentRepository paymentRepository = locator<PaymentRepository>();

  @override
  void initState() {
    startDateController.text = formatDateTime(DateTime.now());
    endDateController.text =
        formatDateTime(DateTime.now().add(widget.package.duration));
    price =
        calculatePrice(widget.package.price, widget.package.discountPercentage);
    super.initState();
  }

  Widget buildText(String text) => CustomerText(
        text,
        fontWeight: FontWeight.bold,
        fontSize: fontSize16,
      );

  sendRequest() {
    widget.callback(widget.package.id, DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: CustomAppBarTitle(
              text:
                  '${widget.endDate != null ? 'Gia hạn ' : 'Đăng ký '}gói đọc'),
        ),
        body: Container(
          padding: const EdgeInsets.all(double12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(double20),
                alignment: Alignment.center,
                child: CustomerText(
                    (widget.endDate != null ? 'Gia hạn ' : 'Đăng ký ') +
                        widget.package.name,
                    fontSize: fontSize18,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Flexible(
                      child: TextField(
                          controller: startDateController,
                          decoration: const InputDecoration(
                              icon: Icon(Icons.calendar_today),
                              labelText: 'Ngày bắt đầu'),
                          readOnly: true,
                          enabled: false)),
                  Flexible(
                      child: TextField(
                    controller: endDateController,
                    decoration: const InputDecoration(
                        icon: Icon(Icons.calendar_today),
                        //icon of text field
                        labelText: 'Ngày hết hạn' //label text of field
                        ),
                    readOnly: true,
                    enabled: false,
                  ))
                ],
              ),
              verticalSpace20,
              Container(
                padding: const EdgeInsets.only(right: double20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildText('Tổng tiền'),
                    buildText(NumberFormat.simpleCurrency(locale: 'vi')
                        .format(price)),
                  ],
                ),
              ),
              verticalSpace12,
              buildText(
                'Chọn phương thức thanh toán',
              ),
              verticalSpace12,
              ...List<Widget>.generate(paymentMethods.length, (index) {
                Map data = paymentMethods[index];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () => setState(() {
                              selected = index;
                            }),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(double12),
                          decoration: BoxDecoration(
                            color: index == selected
                                ? AppColors.primary_4
                                : AppColors.backgroundColor,
                            borderRadius: BorderRadius.circular(double16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: double16,
                                    backgroundImage:
                                        AssetImage('${data['image']}'),
                                  ),
                                  horizontalSpace8,
                                  CustomerText(
                                    '${data['name']}',
                                    fontWeight: FontWeight.bold,
                                    fontSize: fontSize14,
                                  ),
                                ],
                              ),
                              index == selected
                                  ? const Icon(
                                      Icons.check_circle,
                                      color: AppColors.primary_1,
                                      size: double20,
                                    )
                                  : Wrap()
                            ],
                          ),
                        )),
                    verticalSpace12
                  ],
                );
              }),
              widget.isUsing!
                  ? CustomerText(
                      'Bạn đồng ý đăng ký ${widget.package.name} và huỷ gói đọc sách hiện tại?',
                      fontWeight: FontWeight.w500,
                      fontSize: fontSize16,
                      isEllipsis: false,
                      color: AppColors.primary_1,
                    )
                  : Wrap()
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(double12),
          child: CustomButton(
              text: 'Xác nhận',
              size: ButtonSize.normal,
              onPressed: () async {
                int amount = price.toInt();
                if (amount < 1000 || amount > 1000000) {
                  setState(() {
                    zpTransToken = 'Invalid Amount';
                  });
                } else {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      });

                  var result = await paymentRepository.createOrder(amount);
                  if (result != null) {
                    Navigator.pop(context);
                    zpTransToken = result.zptranstoken;
                    print("zpTransToken $zpTransToken'.");
                    setState(() {
                      zpTransToken = result.zptranstoken;
                      showResult = true;
                    });
                    context.navigateTo(ConfirmPayment(
                      amount: price.toInt(),
                      zpToken: zpTransToken,
                      callback: sendRequest,
                    ));
                  }
                }
              }),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
