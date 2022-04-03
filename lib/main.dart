import 'package:coffee_counter/presentation/home_page.dart';
import 'package:coffee_counter/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kaffeezähler',
      theme: AppTheme.darkTheme,
      home: const HomePage(),
    );
  }
}
