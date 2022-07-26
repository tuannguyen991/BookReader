import 'package:flutter/material.dart';

class TabUserPage extends StatefulWidget {
  const TabUserPage({Key? key}) : super(key: key);

  @override
  State<TabUserPage> createState() => _TabUserPageState();
}

class _TabUserPageState extends State<TabUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
      ),
    );
  }
}
