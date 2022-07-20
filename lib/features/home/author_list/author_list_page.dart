import 'package:demo_book_reader/data/repository/author_repository.dart';
import 'package:demo_book_reader/di/locator.dart';
import 'package:demo_book_reader/feature/author_list/bloc/authors_bloc.dart';
import 'package:demo_book_reader/models/author_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthorListPage extends StatefulWidget {
  const AuthorListPage({Key? key}) : super(key: key);

  @override
  State<AuthorListPage> createState() => _AuthorListPageState();
}

class _AuthorListPageState extends State<AuthorListPage> {
  final _bloc = AuthorsBloc(authorRepository: locator<AuthorRepository>());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _bloc.add(AuthorsLoaded());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthorsBloc>.value(
      value: _bloc,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Authors"),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.add),
              )
            ],
          ),
          body: const _List()
      ),
    );
  }
}

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
