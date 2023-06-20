import 'package:flutter/material.dart';

class GigPosting {
  final String title;
  final String description;

  GigPosting({
    required this.title,
    required this.description,
  });

  @override
  String toString() {
    return 'GigPosting(title: $title, description: $description)';
  }
}
