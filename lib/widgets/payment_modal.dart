import 'package:demo_book_reader/models/reading_package/reading_package_model.dart';
import 'package:demo_book_reader/share/enum/button_type.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/customer/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'customer/customer_text.dart';

class PaymentModal extends StatefulWidget {
  final ReadingPackageModel package;
  final DateTime? endDate;

  const PaymentModal({Key? key, required this.package, this.endDate})
      : super(key: key);

  @override
  State<PaymentModal> createState() => _PaymentModalState();
}

class _PaymentModalState extends State<PaymentModal> {
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  int selected = 0;
  List<Map> paymentMethods = [
    {'name': 'Ví Momo', 'image': 'assets/image/momo.jpg'},
    {'name': 'Chuyển khoản qua ngân hàng', 'image': 'assets/image/bank.png'}
  ];

  @override
  void initState() {
    startDateController.text = widget.endDate != null
        ? DateFormat('dd-MM-yyyy')
            .format(widget.endDate!.add(const Duration(days: 1)))
        : '';
    endDateController.text = widget.endDate != null
        ? DateFormat('dd-MM-yyyy')
            .format(widget.endDate!.add(const Duration(days: 31)))
        : '';
    super.initState();
  }

  Widget buildText(String text) => CustomerText(
        text,
        fontWeight: FontWeight.bold,
        fontSize: fontSize18,
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
                fontSize: fontSize20,
                fontWeight: FontWeight.bold,
              ),
              CloseButton(
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
          verticalSpace12,
          Row(
            children: [
              Flexible(
                  child: TextField(
                controller: startDateController,
                decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today),
                    labelText: 'Ngày bắt đầu'),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(DateTime.now().year + 1));

                  if (pickedDate != null) {
                    String formattedStartDate =
                        DateFormat('dd-MM-yyyy').format(pickedDate);
                    String formattedEndDate = DateFormat('dd-MM-yyyy')
                        .format(pickedDate.add(Duration(days: 30)));

                    setState(() {
                      startDateController.text = formattedStartDate;
                      endDateController.text = formattedEndDate;
                    });
                  }
                },
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
            padding: EdgeInsets.only(right: double20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildText('Tổng tiền'),
                buildText('${widget.package.price} đ'),
              ],
            ),
          ),
          verticalSpace12,
          buildText(
            'Chọn phương thức thanh toán',
          ),
          verticalSpace12,
          SizedBox(
            height: 150,
            child: ListView.builder(
              itemBuilder: (builder, index) {
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
                          padding: const EdgeInsets.all(double8),
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
                                    radius: double20,
                                    backgroundColor: AppColors.backgroundColor,
                                    child: CircleAvatar(
                                      radius: double56,
                                      backgroundImage: AssetImage('${data['image']}'),
                                    ),
                                  ),
                                  horizontalSpace8,
                                  CustomerText(
                                    '${data['name']}',
                                    fontWeight: FontWeight.bold,
                                    fontSize: fontSize16,
                                  ),
                                ],
                              ),
                              index == selected ? Icon(Icons.check_circle, color: AppColors.primary_1,): Wrap()
                            ],
                          ),
                        )),
                    verticalSpace12
                  ],
                );
              },
              itemCount: paymentMethods.length,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(text: 'Thanh toán', size: ButtonSize.compact, onPressed: () => null),
            ],
          )
        ],
      ),
    );
  }
}
