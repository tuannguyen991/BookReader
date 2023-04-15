import 'package:demo_book_reader/helper/utils/func.dart';
import 'package:demo_book_reader/models/reading_package/reading_package_model.dart';
import 'package:demo_book_reader/share/enum/button_type.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/customer/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'customer/customer_text.dart';

class PaymentModal extends StatefulWidget {
  final bool? isUsing;
  final ReadingPackageModel package;
  final DateTime? endDate;
  final Function callback;

  const PaymentModal(
      {Key? key, required this.package, this.endDate, required this.callback, this.isUsing = false})
      : super(key: key);

  @override
  State<PaymentModal> createState() => _PaymentModalState();
}

class _PaymentModalState extends State<PaymentModal> {
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  int selected = 0;
  List<Map> paymentMethods = [
    {'name': 'Ví MoMo', 'image': 'assets/image/momo.png'},
    {'name': 'Chuyển khoản qua ngân hàng', 'image': 'assets/image/bank.png'}
  ];

  @override
  void initState() {
    startDateController.text = formatDateTime(DateTime.now());
    endDateController.text = formatDateTime(DateTime.now().add(widget.package.duration));
    super.initState();
  }

  Widget buildText(String text) => CustomerText(
        text,
        fontWeight: FontWeight.bold,
        fontSize: fontSize16,
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(double12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomerText(
                (widget.endDate != null ? 'Gia hạn ' : 'Đăng ký ') +
                    widget.package.name,
                fontSize: fontSize18,
                fontWeight: FontWeight.bold,
              ),
              CloseButton(
                onPressed: () => Navigator.pop(context),
              )
            ],
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
                enabled: false
              )),
              Flexible(
                  child: TextField(
                controller: endDateController,
                decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today), //icon of text field
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
                buildText(NumberFormat.simpleCurrency(locale: 'vi').format(
                    calculatePrice(widget.package.price,
                        widget.package.discountPercentage))),
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
                    padding: const EdgeInsets.only(top: double4, bottom: double4, left: double8, right: double8),
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
                          size: double16,
                        )
                            : Wrap()
                      ],
                    ),
                  )),
              verticalSpace12
            ],
          );
        }),
          widget.isUsing! ? CustomerText(
            'Bạn đồng ý đăng ký ${widget.package.name} và huỷ gói đọc sách hiện tại?',
            fontWeight: FontWeight.w500,
            fontSize: fontSize16,
            isEllipsis: false,
            color: AppColors.primary_1,
          ): Wrap(),
          verticalSpace12,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                  text: 'Thanh toán',
                  size: ButtonSize.compact,
                  onPressed: () =>
                      widget.callback(widget.package.id, DateTime.now())),
            ],
          )
        ],
      ),
    );
  }
}
