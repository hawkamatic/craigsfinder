import 'dart:async';
import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'lib/src/class/class.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Craigslist Moving Jobs',
      home: CraigslistMovingJobs(),
    );
  }
}

class CraigslistMovingJobs extends StatefulWidget {
  @override
  State createState() => CraigslistMovingJobsState();
}

class CraigslistMovingJobsState extends State<CraigslistMovingJobs> {
  List<Map<String, dynamic>> jobs = [];

  Future<List<MovingJob>> _getMovingJobs() async {
    final url =
        Uri.parse('https://seattle.craigslist.org/search/mjs?query=moving');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['results'];
      return data.map((job) => MovingJob.fromJson(job)).toList();
    } else {
      throw Exception('Failed to get moving jobs');
    }
  }

  @override
  void initState() {
    super.initState();
    _getMovingJobs();
    Timer.periodic(Duration(minutes: 5), (_) => _getMovingJobs());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Craigslist Moving Jobs'),
      ),
      body: ListView.builder(
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          final job = jobs[index];
          return ListTile(
            title: Text(job['title']),
            subtitle: Text(job['description']),
          );
        },
      ),
    );
  }
}
