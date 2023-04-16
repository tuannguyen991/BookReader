import 'package:demo_book_reader/share/enum/button_type.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/customer/customer_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zalopay_sdk/flutter_zalopay_sdk.dart';
import 'package:intl/intl.dart';

import 'customer/custom_button.dart';

class ConfirmPayment extends StatefulWidget {
  final int amount;
  final String zpToken;

  const ConfirmPayment({Key? key, required this.amount, required this.zpToken})
      : super(key: key);

  @override
  State<ConfirmPayment> createState() => _ConfirmPaymentState();
}

class _ConfirmPaymentState extends State<ConfirmPayment> {
  String payResult = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Xác nhận thanh toán'),
        ),
        body: Container(
          padding: const EdgeInsets.all(double20),
          alignment: Alignment.center,
          child: Card(
            elevation: double4,
            child: Padding(
              padding: const EdgeInsets.all(double20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: const CustomerText('Tổng tiền', fontSize: fontSize18,),
                  ),
                  verticalSpace12,
                  Container(
                    alignment: Alignment.center,
                    child: CustomerText(NumberFormat.simpleCurrency(locale: 'vi').format(widget.amount), fontSize: fontSize20, color: AppColors.primary_1,),
                  ),
                  verticalSpace8,
                  const Divider(),
                  verticalSpace8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomerText('Đơn giá'),
                      CustomerText(NumberFormat.simpleCurrency(locale: 'vi').format(widget.amount)),
                    ],
                  ),
                  verticalSpace12,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CustomerText('Nguồn'),
                      CustomerText('Ví ZaloPay'),
                    ],
                  ),
                  verticalSpace12,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CustomerText('Phí thanh toán'),
                      CustomerText('0đ'),
                    ],
                  ),
                  verticalSpace8,
                  const Divider(),
                  verticalSpace8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomerText('Tổng tiền'),
                      CustomerText(NumberFormat.simpleCurrency(locale: 'vi').format(widget.amount)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(double12),
          child: CustomButton(
              text: 'Thanh toán',
              size: ButtonSize.normal,
              onPressed: () async {
                FlutterZaloPaySdk.payOrder(zpToken: widget.zpToken)
                    .listen((event) {
                  setState(() {
                    switch (event) {
                      case FlutterZaloPayStatus.cancelled:
                        payResult = 'User Huỷ Thanh Toán';
                        break;
                      case FlutterZaloPayStatus.success:
                        payResult = 'Thanh toán thành công';
                        break;
                      case FlutterZaloPayStatus.failed:
                        payResult = 'Thanh toán thất bại';
                        break;
                      default:
                        payResult = 'Thanh toán thất bại';
                        break;
                    }
                  });
                  showDialog(context: context, builder: (BuildContext context) {
                    return AlertDialog(
                      title: CustomerText(payResult),
                      icon: payResult == 'Thanh toán thành công'? const Icon(Icons.check_circle): const Icon(Icons.warning),
                      iconColor: payResult == 'Thanh toán thành công'? Colors.green: Colors.red,
                      actionsAlignment: MainAxisAlignment.center,
                      actions: [
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                          ),
                          child: const CustomerText('Đóng'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  });
                });
              }),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
