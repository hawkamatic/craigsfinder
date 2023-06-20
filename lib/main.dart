import 'package:flutter/material.dart';

import 'features/presentation/pages/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Craigslist Gig Scraper',
      home: HomePage(),
    );
  }
}
