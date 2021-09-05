import 'package:flutter/material.dart';
import 'package:flutter_learning/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(textTheme: TextTheme().copyWith()),
      darkTheme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
