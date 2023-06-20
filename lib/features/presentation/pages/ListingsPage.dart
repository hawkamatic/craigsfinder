import 'package:flutter/material.dart';

import '../../gigs/data/models/GigPosting.dart';

class ListingsPage extends StatelessWidget {
  final GigPosting gigPosting;

  const ListingsPage({Key? key, required this.gigPosting}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gigPosting.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(gigPosting.description),
          ],
        ),
      ),
    );
  }
}
