import 'package:demo_book_reader/di/locator.dart';
import 'package:flutter/material.dart';

import 'app.dart';

Future<void> main() async {
  setupLocator();
  runApp(const MyApp());
}
 
// fvm flutter pub run build_runner build --delete-conflicting-outputs
