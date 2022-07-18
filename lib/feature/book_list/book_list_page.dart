import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/di/locator.dart';
import 'package:demo_book_reader/feature/book_list/bloc/books_bloc.dart';
import 'package:demo_book_reader/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({Key? key}) : super(key: key);

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  final _bloc = BooksBloc(bookRepository: locator<BookRepository>());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc.add(BooksLoaded());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BooksBloc>.value(
        value: _bloc,
        child:  Scaffold(
          appBar: AppBar(
            title: const Text("Books"),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          body: const _List(),
        ),
    );
  }
}

class _List extends StatelessWidget {
  const _List({Key? key}) : super(key: key);
  void showBookMenu(BuildContext context, BookModel model) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ListTile(
                  title: Text("Xem chi tiết"),
                ),
                ListTile(
                  title: Text("Xóa"),
                  onTap: () {
                    Navigator.pop(context);
                    context
                        .read<BooksBloc>()
                        .add(BooksDeleteRequested(model.authorId));
                  },
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksBloc, BooksState>(
      builder: (context, state) {
        final items = state.books;
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.separated(
          itemCount: items.length,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) {
            final item = items[index];
            return ListTile(
              title: Text(item.name),
              subtitle: Text('${item.rating}'),
              onTap: () {
                showBookMenu(context, item);
              },
            );
          },
        );
      },
    );
  }
}
