import 'package:demo_book_reader/data/repository/book_repository.dart';
import 'package:demo_book_reader/data/repository/author_repository.dart';
import 'package:demo_book_reader/di/locator.dart';
import 'package:demo_book_reader/feature/book_list/bloc/books_bloc.dart';
import 'package:demo_book_reader/models/book_model.dart';
import 'package:demo_book_reader/feature/author_list/bloc/authors_bloc.dart';
import 'package:demo_book_reader/models/author_model.dart';
import 'package:demo_book_reader/theme/ui_constant.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({Key? key}) : super(key: key);

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  final _bloc = BooksBloc(bookRepository: locator<BookRepository>());
  final _bloc2= AuthorsBloc(authorRepository: locator<AuthorRepository>());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bloc.add(BooksLoaded());
    _bloc2.add(AuthorsLoaded());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<BooksBloc>.value(
            value: _bloc,
          ),
          BlocProvider<AuthorsBloc>.value(
            value: _bloc2,
          ),
        ],
      child:  Scaffold(
        appBar: AppBar(
          title: const Text("Books"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
          ],
          bottom: const BookListChips(),
          elevation: 0,
        ),
        body: const _List(),
      ),
    );
    /*
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
            bottom: const BookListChips(),
            elevation: 0,
          ),
          body: const _List(),
        ),
    );
     */
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
        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
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
        return BlocBuilder<AuthorsBloc,AuthorsState>(
          builder: (context,state2){
            final authors = state2.authors;
            Widget starIcon=const Icon(Icons.star,color: Color(0xFFFFC107),size: 14,);
            Widget starIconOff=const Icon(Icons.star,color: Color(0xFFD2D8E0),size: 14,);
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                  width: 414,
                  height: 93,
                  child: Row(children: [
                      Image(image: AssetImage(item.bookUrl),width: 46,height: 64,),
                      size16,
                      Column(
                        children:[
                          Text(
                            item.name,
                            style: TextStyle(
                              fontSize: 14,
                              height: 10/7,
                              fontFamily: 'Intel',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '${item.authorId}',
                            style: TextStyle(
                              fontSize: 12,
                              height: 4/3,
                              fontFamily: 'Intel',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Row(children:[
                            if(item.rating>=1)starIcon,
                            if(item.rating<1)starIconOff,
                            size4,
                            if(item.rating>=2)starIcon,
                            if(item.rating<2)starIconOff,
                            size4,
                            if(item.rating>=3)starIcon,
                            if(item.rating<3)starIconOff,
                            size4,
                            if(item.rating>=4)starIcon,
                            if(item.rating<4)starIconOff,
                            size4,
                            if(item.rating>=5)starIcon,
                            if(item.rating<5)starIconOff,
                        ],),
                          Container(
                            width: 175,
                            padding: const EdgeInsets.only(top: 8),
                            child:ClipRRect(
                              borderRadius: BorderRadius.circular(3),
                              child: LinearProgressIndicator(
                                minHeight: 3,
                                value: 0.5,
                                backgroundColor: const Color(0xFFE9EDF2),
                                valueColor: const AlwaysStoppedAnimation(Color(0xFF4F51B4)),
                              ),
                            ),
                          ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                    Expanded(child: IconButton(
                        alignment: Alignment.topRight,
                        onPressed: (){},
                        icon: Icon(Icons.more_horiz,color: Color(0xFF858F9B),)
                    ),),
                  ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                );
              },
            );
          },
        );
      }
      );
  }
}
/*
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
 */
/*
return ListView.builder(
              itemCount: items.length,
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
 */
