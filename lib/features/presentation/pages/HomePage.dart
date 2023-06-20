import 'package:flutter/material.dart';

import '../../../features/gigs/data/models/GigPosting.dart';
import '../../../features/gigs/data/services/CraigslistScraper.dart';
import 'ListingsPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  List<GigPosting> gigPostings = [];

  @override
  void initState() {
    super.initState();

    // Scrape Craigslist for gig postings.
    CraigslistScraper.scrape().then((gigPostings) {
      setState(() {
        this.gigPostings = gigPostings;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Craigslist Gig Scraper'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search for gigs...',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: gigPostings.length,
              itemBuilder: (context, index) {
                GigPosting gigPosting = gigPostings[index];

                return ListTile(
                  title: Text(gigPosting.title),
                  subtitle: Text(gigPosting.description),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ListingsPage(gigPosting: gigPosting),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
