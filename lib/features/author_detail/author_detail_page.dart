import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/di/locator.dart';
import 'package:demo_book_reader/features/author_detail/bloc/author_detail_bloc.dart';
import 'package:demo_book_reader/features/book_detail/book_detail_page.dart';
import 'package:demo_book_reader/models/author/author_model.dart';
import 'package:demo_book_reader/share/extensions/build_context_extensions.dart';
import 'package:demo_book_reader/theme/app_colors.dart';
import 'package:demo_book_reader/theme/constant.dart';
import 'package:demo_book_reader/widgets/customer/customer_readmore.dart';
import 'package:demo_book_reader/widgets/customer/customer_text.dart';
import 'package:demo_book_reader/widgets/model_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorDetailPage extends StatefulWidget {
  const AuthorDetailPage({
    Key? key,
    required this.author,
  }) : super(key: key);

  final AuthorModel author;

  @override
  State<AuthorDetailPage> createState() => _AuthorDetailPageState();
}

class _AuthorDetailPageState extends State<AuthorDetailPage> {
  final _bloc = AuthorDetailBloc(
    bookRepository: locator<BookRepository>(),
  );

  @override
  void initState() {
    super.initState();
    _bloc.add(AuthorDetailLoaded(authorId: widget.author.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        appBar: AppBar(title: Text(widget.author.name)),
        body: _buildBody(),
      ),
    );
  }

  Widget buildPersonalInfo() {
    return Column(
      children: [
        CircleAvatar(
          radius: double60,
          backgroundColor: AppColors.backgroundColor,
          child: CircleAvatar(
            radius: double56,
            backgroundImage: (widget.author.imageLink == '')
                ? const AssetImage('assets/image/default.jpeg') as ImageProvider
                : NetworkImage(widget.author.imageLink),
          ),
        ),
        verticalSpace8,
        CustomerText(
          widget.author.name,
          isCenter: true,
          fontSize: fontSize16,
          fontWeight: FontWeight.bold,
          // color: AppColors.backgroundColor,
        ),
      ],
    );
  }

  Widget _buildBody() {
    final authorItem = widget.author;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(double16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: buildPersonalInfo(),
            ),
            verticalSpace16,
            CustomerReadMoreText(text: widget.author.shortBio),
            verticalSpace16,
            BlocBuilder<AuthorDetailBloc, AuthorDetailState>(
              builder: (context, state) {
                var books = state.books;

                return Column(
                  children: List<Widget>.generate(
                    state.books.length,
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
              },
            )
          ],
        ),
      ),
    );
  }
}
