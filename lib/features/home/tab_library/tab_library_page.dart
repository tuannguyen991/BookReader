import 'package:flutter/material.dart';

class TabLibraryPage extends StatefulWidget {
  const TabLibraryPage({Key? key}) : super(key: key);

  @override
  State<TabLibraryPage> createState() => _TabLibraryPageState();
}

class _TabLibraryPageState extends State<TabLibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Library"),
      ),
    );
  }
}
