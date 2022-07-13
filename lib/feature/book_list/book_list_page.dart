import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/data/repository_fake/book_repository_fake.dart';
import 'package:demo_book_reader/di/locator.dart';
//import 'package:demo_book_reader/feature/author_list/bloc/books_bloc.dart';
import 'package:demo_book_reader/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({Key? key}) : super(key: key);

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Authors"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: null,
    );
  }
}

/*
class _List extends StatelessWidget {
  const _List({Key? key}) : super(key: key);
  void showAuthorMenu(BuildContext context, AuthorModel model) {
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
                        .read<AuthorsBloc>()
                        .add(AuthorsDeleteRequested(model.id));
                  },
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthorsBloc, AuthorsState>(
      builder: (context, state) {
        final items = state.authors;
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
              subtitle: Text(item.gender),
              onTap: () {
                showAuthorMenu(context, item);
              },
            );
          },
        );
      },
    );
  }
}
 */