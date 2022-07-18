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
            bottom:BookListChips(),
            elevation: 0,
          ),
          body: _List(),
        ),
    );
  }
}


class BookListChips extends StatefulWidget implements PreferredSizeWidget{
  const BookListChips({Key? key}) : super(key: key);

  @override
  State<BookListChips> createState() => _BookListChipsState();

  @override
  Size get preferredSize => const Size(double.infinity,48);
}

class _BookListChipsState extends State<BookListChips>{
  int selectedIndex=0;
  final List<IndexChips> _chipsList = [
    IndexChips('Sách đang đọc'),
    IndexChips('Sách yêu thích',),
    IndexChips('Sách tải lên',),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 414,
      color: Colors.white,
      child:SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children:testChips(),
        ),
      ),
    );
  }

  List<Widget>testChips(){
    List<Widget> chips = [];
    for (int i=0; i< _chipsList.length; i++) {
      Widget item = Container(
        height: 56,
        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
        child: ChoiceChip(
          label: Text(_chipsList[i].label),
          labelStyle: TextStyle(
            color: selectedIndex==i? const Color(0xFFF0F1F3):const Color(0xFF6B7280),
          ),
          backgroundColor: const Color(0xFFF0F1F3),
          selected: selectedIndex == i,
          selectedColor: const Color(0xFF4F51B4),
          onSelected: (bool value)
          {
            setState(() {
              selectedIndex = i;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }
}
class IndexChips{
  String label;
  IndexChips(this.label);
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
                ListTile(
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
              leading: SizedBox(
                width: 46,
                height: 64,
                child: Image(image:AssetImage(item.bookUrl),),
              ),
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