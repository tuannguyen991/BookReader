// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/di/locator.dart';
import 'package:demo_book_reader/features/book_detail/book_detail_page.dart';
import 'package:demo_book_reader/features/home/tab_library/bloc/tab_library_bloc.dart';
import 'package:demo_book_reader/models/user_book/user_book_model.dart';
import 'package:demo_book_reader/share/extensions/build_context_extensions.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/customer/customer_clip_rrect.dart';
import 'package:demo_book_reader/widgets/customer/customer_text.dart';
import 'package:demo_book_reader/widgets/modal_item.dart';
import 'package:demo_book_reader/widgets/model_item.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:flutter/services.dart';

class TabLibraryPage extends StatefulWidget {
  const TabLibraryPage({Key? key}) : super(key: key);

  @override
  State<TabLibraryPage> createState() => _TabLibraryPageState();
}

class _TabLibraryPageState extends State<TabLibraryPage> {
  final _bloc = TabLibraryBloc(
    bookRepository: locator<BookRepository>(),
  );

  final libraryChoice = ['Sách đang đọc', 'Sách yêu thích', 'PDF Tải lên'];

  @override
  void initState() {
    super.initState();

    _bloc.add(TabLibraryLoaded());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Thư viện'),
          actions: [
            BlocBuilder<TabLibraryBloc, TabLibraryState>(
              builder: (context, state) {
                return IconButton(
                  onPressed: () {
                    if (state.indexChoice != 2) {
                      _buildShowModalBottomSheet(context);
                    }
                  },
                  icon: const Icon(Icons.settings),
                );
              },
            ),
          ],
        ),
        body: _buildBody(),
      ),
    );
  }

  void _buildShowModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(double16),
          topRight: Radius.circular(double16),
        ),
      ),
      builder: (BuildContext context) {
        return BlocProvider.value(
          value: _bloc,
          child: Builder(builder: (context) {
            return Container(
              padding: const EdgeInsets.only(
                top: double16,
                left: double16,
                right: double16,
                bottom: double24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Center(
                    child: CustomerText(
                      'Cài đặt',
                      fontSize: fontSize20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  verticalSpace32,
                  ModalItem(
                    icon: Icons.list,
                    title: 'Hiển thị theo danh sách dọc',
                    onTap: () {
                      context.off();
                      context
                          .read<TabLibraryBloc>()
                          .add(TabLibraryChangeModelShow(isGrid: false));
                    },
                  ),
                  ModalItem(
                    icon: Icons.grid_view_rounded,
                    title: 'Hiển thị theo danh sách lưới',
                    onTap: () {
                      context.off();
                      context
                          .read<TabLibraryBloc>()
                          .add(TabLibraryChangeModelShow(isGrid: true));
                    },
                  ),
                  // ModalItem(
                  //   icon: Icons.upload,
                  //   title: 'Tải sách lên',
                  //   onTap: () {
                  //     context.off();
                  //     context.navigateTo(const LibraryUploadPage());
                  //   },
                  // ),
                ],
              ),
            );
          }),
        );
      },
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: double16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<TabLibraryBloc, TabLibraryState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List<Widget>.generate(
                      libraryChoice.length,
                      (index) {
                        final isSelected = (index == state.indexChoice);
                        return CustomerChoiceChip(
                          libraryChoice: libraryChoice,
                          isSelected: isSelected,
                          index: index,
                        );
                      },
                    ),
                  ),
                );
              },
            ),
            verticalSpace8,
            BlocBuilder<TabLibraryBloc, TabLibraryState>(
              builder: (context, state) {
                if (state.indexChoice != 2) {
                  late final List<UserBookModel> books;
                  if (state.indexChoice == 0) {
                    books = state.readBooks;
                  } else if (state.indexChoice == 1) {
                    books = state.favoriteBooks;
                  }

                  final isGridShow = state.isGridShow;

                  if (isGridShow) {
                    return GridView.count(
                      padding: EdgeInsets.zero,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      childAspectRatio: 0.5,
                      children: List.generate(
                        books.length,
                        (index) {
                          final bookItem = books[index];
                          return InkWell(
                            child: BookItem(
                              bookItem: bookItem,
                              isGridView: true,
                              isLibrary: true,
                            ),
                            onTap: () {
                              context.navigateTo(
                                  BookDetailPage(bookItem: bookItem));
                            },
                          );
                        },
                      ),
                    );
                  }

                  return Column(
                    children: List<Widget>.generate(
                      books.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(bottom: double8),
                        child: InkWell(
                          child:
                              BookItem(bookItem: books[index], isLibrary: true),
                          onTap: () {
                            context.navigateTo(
                                BookDetailPage(bookItem: books[index]));
                          },
                        ),
                      ),
                    ),
                  );
                } else {
                  final pdfBooks = state.pdfBooks;
                  return Column(
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['pdf'],
                          );
                          if (result != null) {
                            File file = File(result.files.single.path!);
                            context
                                .read<TabLibraryBloc>()
                                .add(TabLibrarySavePdf(filePath: file.path));

                            context
                                .navigateTo(PdfViewerPage(fileName: file.path));
                          }
                        },
                        child: const Text('Chọn tập tin PDF'),
                      ),
                      Column(
                        children:
                            List<Widget>.generate(pdfBooks.length, (index) {
                          final File file = File(pdfBooks[index]);
                          return Padding(
                            padding: const EdgeInsets.only(
                              top: double12,
                              bottom: double12,
                            ),
                            child: InkWell(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Flexible(
                                    flex: 1,
                                    child: CustomerClipRRect(
                                      image: 'assets/image/pdf.png',
                                      isAssets: true,
                                    ),
                                  ),
                                  horizontalSpace8,
                                  Flexible(
                                    flex: 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomerText(
                                          basename(file.path),
                                          fontSize: fontSize14,
                                          maxLines: 2,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        verticalSpace4,
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                context.navigateTo(
                                    PdfViewerPage(fileName: file.path));
                              },
                            ),
                          );
                        }),
                      )
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomerChoiceChip extends StatelessWidget {
  const CustomerChoiceChip({
    Key? key,
    required this.libraryChoice,
    required this.isSelected,
    required this.index,
  }) : super(key: key);

  final List<String> libraryChoice;
  final bool isSelected;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: double8),
      child: ChoiceChip(
        label: Text(libraryChoice[index]),
        selected: isSelected,
        labelStyle: TextStyle(
          color:
              isSelected ? AppColors.backgroundColor : AppColors.secondaryColor,
        ),
        selectedColor: AppColors.primaryColor,
        onSelected: ((isSelected) {
          if (isSelected) {
            context
                .read<TabLibraryBloc>()
                .add(TabLibraryChangeIndexChoice(index: index));
          }
        }),
        backgroundColor: AppColors.secondaryBackgroundColor,
      ),
    );
  }
}

// class PdfViewerPage extends StatelessWidget {
//   final File file;

//   const PdfViewerPage({Key? key, required this.file}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final fileName = basename(file.path);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(fileName),
//       ),
//       body: SfPdfViewer.file(file),
//     );
//   }
// }

/// Represents Homepage for Navigation
class PdfViewerPage extends StatefulWidget {
  const PdfViewerPage({Key? key, required this.fileName}) : super(key: key);

  final String fileName;

  @override
  State<PdfViewerPage> createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  final PdfViewerController _pdfViewerController = PdfViewerController();
  Uint8List? _documentBytes;
  OverlayEntry? _overlayEntry;
  double yOffset = 0.0;
  double xOffset = 0.0;
  final Color _contextMenuColor = const Color(0xFFFFFFFF);
  final Color _textColor = const Color(0xFF000000);

  @override
  void initState() {
    getPdfBytes();
    super.initState();
  }

  @override
  void dispose() {
    File file = File(widget.fileName);
    List<int> intList = _documentBytes!.toList();

    file.writeAsBytesSync(intList);
    super.dispose();
  }

  ///Get the PDF document as bytes
  void getPdfBytes() async {
    final file = File(widget.fileName);
    _documentBytes = file.readAsBytesSync();
    setState(() {});
  }

  ///Add the annotation in PDF document
  Widget _addAnnotation(String? annotationType, String? selectedText) {
    return SizedBox(
      height: 30,
      width: 100,
      child: RawMaterialButton(
        onPressed: () async {
          _checkAndCloseContextMenu();
          await Clipboard.setData(ClipboardData(text: selectedText!));
          _drawAnnotation(annotationType);
        },
        child: Text(
          annotationType!,
          style: TextStyle(
              color: _textColor,
              fontSize: 10,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  ///Draw the annotation in PDF document
  void _drawAnnotation(String? annotationType) {
    final PdfDocument document = PdfDocument(inputBytes: _documentBytes);
    switch (annotationType) {
      case 'Highlight':
        {
          _pdfViewerKey.currentState!
              .getSelectedTextLines()
              .forEach((pdfTextLine) {
            final PdfPage _page = document.pages[pdfTextLine.pageNumber];
            final PdfRectangleAnnotation rectangleAnnotation =
                PdfRectangleAnnotation(
                    pdfTextLine.bounds, 'Highlight Annotation',
                    author: 'Syncfusion',
                    color: PdfColor.fromCMYK(0, 0, 255, 0),
                    innerColor: PdfColor.fromCMYK(0, 0, 255, 0),
                    opacity: 0.5);
            _page.annotations.add(rectangleAnnotation);
            _page.annotations.flattenAllAnnotations();
            xOffset = _pdfViewerController.scrollOffset.dx;
            yOffset = _pdfViewerController.scrollOffset.dy;
          });
          final List<int> bytes = document.saveSync();
          setState(() {
            _documentBytes = Uint8List.fromList(bytes);
          });
        }
        break;
      case 'Underline':
        {
          _pdfViewerKey.currentState!
              .getSelectedTextLines()
              .forEach((pdfTextLine) {
            final PdfPage _page = document.pages[pdfTextLine.pageNumber];
            final PdfLineAnnotation lineAnnotation = PdfLineAnnotation(
              [
                pdfTextLine.bounds.left.toInt(),
                (document.pages[pdfTextLine.pageNumber].size.height -
                        pdfTextLine.bounds.bottom)
                    .toInt(),
                pdfTextLine.bounds.right.toInt(),
                (document.pages[pdfTextLine.pageNumber].size.height -
                        pdfTextLine.bounds.bottom)
                    .toInt()
              ],
              'Underline Annotation',
              author: 'Syncfusion',
              innerColor: PdfColor(0, 255, 0),
              color: PdfColor(0, 255, 0),
            );
            _page.annotations.add(lineAnnotation);
            _page.annotations.flattenAllAnnotations();
            xOffset = _pdfViewerController.scrollOffset.dx;
            yOffset = _pdfViewerController.scrollOffset.dy;
          });
          final List<int> bytes = document.saveSync();
          setState(() {
            _documentBytes = Uint8List.fromList(bytes);
          });
        }
        break;
      case 'Strikethrough':
        {
          _pdfViewerKey.currentState!
              .getSelectedTextLines()
              .forEach((pdfTextLine) {
            final PdfPage _page = document.pages[pdfTextLine.pageNumber];
            final PdfLineAnnotation lineAnnotation = PdfLineAnnotation(
              [
                pdfTextLine.bounds.left.toInt(),
                ((document.pages[pdfTextLine.pageNumber].size.height -
                            pdfTextLine.bounds.bottom) +
                        (pdfTextLine.bounds.height / 2))
                    .toInt(),
                pdfTextLine.bounds.right.toInt(),
                ((document.pages[pdfTextLine.pageNumber].size.height -
                            pdfTextLine.bounds.bottom) +
                        (pdfTextLine.bounds.height / 2))
                    .toInt()
              ],
              'Strikethrough Annotation',
              author: 'Syncfusion',
              innerColor: PdfColor(255, 0, 0),
              color: PdfColor(255, 0, 0),
            );
            _page.annotations.add(lineAnnotation);
            _page.annotations.flattenAllAnnotations();
            xOffset = _pdfViewerController.scrollOffset.dx;
            yOffset = _pdfViewerController.scrollOffset.dy;
          });
          final List<int> bytes = document.saveSync();
          setState(() {
            _documentBytes = Uint8List.fromList(bytes);
          });
        }
        break;
    }
  }

  /// Show Context menu with annotation options.
  void _showContextMenu(
    BuildContext context,
    PdfTextSelectionChangedDetails? details,
  ) {
    final RenderBox renderBoxContainer =
        context.findRenderObject()! as RenderBox;
    const double kContextMenuHeight = 90;
    const double kContextMenuWidth = 100;
    const double kHeight = 18;
    final Offset containerOffset = renderBoxContainer.localToGlobal(
      renderBoxContainer.paintBounds.topLeft,
    );
    if (details != null &&
            containerOffset.dy < details.globalSelectedRegion!.topLeft.dy ||
        (containerOffset.dy <
                details!.globalSelectedRegion!.center.dy -
                    (kContextMenuHeight / 2) &&
            details.globalSelectedRegion!.height > kContextMenuWidth)) {
      double top = 0.0;
      double left = 0.0;
      final Rect globalSelectedRect = details.globalSelectedRegion!;
      if ((globalSelectedRect.top) > MediaQuery.of(context).size.height / 2) {
        top = globalSelectedRect.topLeft.dy +
            details.globalSelectedRegion!.height +
            kHeight;
        left = globalSelectedRect.bottomLeft.dx;
      } else {
        top = globalSelectedRect.height > kContextMenuWidth
            ? globalSelectedRect.center.dy - (kContextMenuHeight / 2)
            : globalSelectedRect.topLeft.dy +
                details.globalSelectedRegion!.height +
                kHeight;
        left = globalSelectedRect.height > kContextMenuWidth
            ? globalSelectedRect.center.dx - (kContextMenuWidth / 2)
            : globalSelectedRect.bottomLeft.dx;
      }
      final OverlayState overlayState = Overlay.of(context, rootOverlay: true);
      _overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
          top: top,
          left: left,
          child: Container(
            decoration: BoxDecoration(
              color: _contextMenuColor,
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.14),
                  blurRadius: 2,
                  offset: Offset(0, 0),
                ),
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.12),
                  blurRadius: 2,
                  offset: Offset(0, 2),
                ),
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.2),
                  blurRadius: 3,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            constraints: const BoxConstraints.tightFor(
                width: kContextMenuWidth, height: kContextMenuHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _addAnnotation('Highlight', details.selectedText),
                _addAnnotation('Underline', details.selectedText),
                _addAnnotation('Strikethrough', details.selectedText),
              ],
            ),
          ),
        ),
      );
      overlayState.insert(_overlayEntry!);
    }
  }

  /// Check and close the context menu.
  void _checkAndCloseContextMenu() {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter PDF Viewer'),
      ),
      body: _documentBytes != null
          ? SfPdfViewer.memory(
              _documentBytes!,
              key: _pdfViewerKey,
              controller: _pdfViewerController,
              onDocumentLoaded: (PdfDocumentLoadedDetails details) {
                _pdfViewerController.jumpTo(xOffset: xOffset, yOffset: yOffset);
              },
              onTextSelectionChanged: (PdfTextSelectionChangedDetails details) {
                if (details.selectedText == null && _overlayEntry != null) {
                  _checkAndCloseContextMenu();
                } else if (details.selectedText != null &&
                    _overlayEntry == null) {
                  _showContextMenu(context, details);
                }
              },
            )
          : Container(),
    );
  }
}
