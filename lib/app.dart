import 'package:flutter/material.dart';

import 'feature/author_list/author_list_page.dart';
import 'feature/book_list/book_list_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Test"),
          actions: [
            Builder(builder: (context) {
              return IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return BookListPage();
                        },
                      ),
                    );
                  },
                  icon: Icon(Icons.add));
            }),
          ],
        ),
      ),
    );
  }
}
