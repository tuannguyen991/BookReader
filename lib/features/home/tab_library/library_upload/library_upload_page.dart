// ignore_for_file: use_build_context_synchronously

import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/data/repository/category_repository.dart';
import 'package:demo_book_reader/di/locator.dart';
import 'package:demo_book_reader/features/home/tab_library/library_upload/bloc/library_upload_bloc.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/customer/customer_alert_dialog.dart';
import 'package:demo_book_reader/widgets/customer/customer_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LibraryUploadPage extends StatefulWidget {
  const LibraryUploadPage({Key? key}) : super(key: key);

  @override
  State<LibraryUploadPage> createState() => _LibraryUploadPageState();
}

class _LibraryUploadPageState extends State<LibraryUploadPage> {
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _descriptionController = TextEditingController();

  final _bloc = LibraryUploadBloc(
    categoryRepository: locator<CategoryRepository>(),
    bookRepository: locator<BookRepository>(),
  );

  @override
  void initState() {
    super.initState();

    _bloc.add(LibraryUploadLoaded());
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
    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              Row(
                children: [
                  BackButton(
                    color: AppColors.secondaryColor,
                  ),
                  horizontalSpace8,
                  const CustomerText(
                    'Tải sách lên',
                    fontSize: fontSize20,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(double16),
                child: Column(
                  children: [
                    InputItem(title: 'Tên sách ', controller: _titleController),
                    InputItem(
                        title: 'Tên tác giả', controller: _authorController),
                    BlocBuilder<LibraryUploadBloc, LibraryUploadState>(
                      builder: (context, state) {
                        final categories =
                            state.categories.map((e) => e.toString()).toList();
                        return DropDownItem(
                          title: 'Thể loại',
                          options: categories,
                        );
                      },
                    ),
                    InputItem(
                      title: 'Mô tả',
                      isDescription: true,
                      controller: _descriptionController,
                    ),
                    const Picker(),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Builder(builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) =>
                          const CustomerAlertDialog(isUpload: true),
                    );
                    context.read<LibraryUploadBloc>().add(LibraryUploadSave(
                      title: _titleController.text,
                      author: _authorController.text,
                      description: _descriptionController.text,
                    ));
                  },
                  child: const Text('Hoàn tất'),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class InputItem extends StatelessWidget {
  const InputItem({
    Key? key,
    required this.title,
    this.isDescription = false,
    required TextEditingController controller,
  })  : _controller = controller,
        super(key: key);

  final String title;
  final bool isDescription;
  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: double16),
      child: TextField(
        controller: _controller,
        maxLines: null,
        maxLength: isDescription ? 300 : null,
        decoration: InputDecoration(
            labelText: title,
            hintStyle: TextStyle(color: AppColors.secondaryColor),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.secondaryColor,
              ),
            )),
      ),
    );
  }
}

class DropDownItem extends StatefulWidget {
  const DropDownItem({Key? key, required this.title, required this.options})
      : super(key: key);
  final String title;
  final List<String> options;
  @override
  State<DropDownItem> createState() => _DropDownItemState();
}

class _DropDownItemState extends State<DropDownItem> {
  String dropdownValue = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: double16),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: widget.title,
        ),
        icon: const Icon(Icons.keyboard_arrow_down),
        iconEnabledColor: AppColors.secondaryColor,
        elevation: 16,
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
          });
        },
        items: widget.options.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}

class Picker extends StatelessWidget {
  const Picker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.secondaryBackgroundColor,
      child: InkWell(
        onTap: () async {
          FilePickerResult? result = await FilePicker.platform.pickFiles();
          context
              .read<LibraryUploadBloc>()
              .add(LibraryUploadEpub(linkEpub: result!.files.single.path!));
        },
        child: DottedBorder(
          // DottedBorder close to the Edge of child widget
          padding: const EdgeInsets.all(0),
          //
          color: const Color(0xFFDDE2E9),
          strokeWidth: 1,
          // Border Radius
          borderType: BorderType.RRect,
          radius: const Radius.circular(double8),
          //
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: double16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.upload_file_rounded,
                  color: AppColors.secondaryColor,
                  size: 24.0,
                ),
                Text(
                  'Cập nhật file epub',
                  style: TextStyle(color: AppColors.secondaryColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
