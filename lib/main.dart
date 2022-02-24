import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

import 'home_page_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Water Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ShowCaseWidget(
        builder: Builder(
          builder: (context) => const HomePage(),
      ),
      ),
    );
  }
}