import 'package:html/dom.dart';

import '../models/GigPosting.dart';
import 'dart:async';
import 'dart:io';

import 'package:html/parser.dart';
import 'package:http/http.dart';

class CraigslistScraper {
  static Future<List<GigPosting>> scrape() async {
    // Get the URL for the Craigslist gigs page.
    Uri gigsUrl = Uri.parse('https://losangeles.craigslist.org/gig/');

    // Make a request to the Craigslist gigs page.
    Response response = await get(gigsUrl);

    // Check if the request was successful.
    if (response.statusCode == 200) {
      // Parse the HTML response into a list of GigPosting objects.
      List<GigPosting> gigPostings = parseGigPostings(response.body);

      // Return the list of GigPosting objects.
      return gigPostings;
    } else {
      // Throw an error if the request was not successful.
      throw Exception(
          'Request to Craigslist failed with status code ${response.statusCode}');
    }
  }

  static List<GigPosting> parseGigPostings(String html) {
    // Create a Document object from the HTML.
    Document document = parse(html);

    // Find all of the gig postings on the page.
    List<Element> gigPostingElements = document.querySelectorAll('.result-row');

    // Create a list of GigPosting objects from the gig postings on the page.
    List<GigPosting> gigPostings = [];
    for (Element gigPostingElement in gigPostingElements) {
      // Get the title of the gig posting.
      String? title = gigPostingElement.querySelector('.result-title')?.text;

      // Get the description of the gig posting.
      String? description =
          gigPostingElement.querySelector('.result-posting')?.text;

      // Create a new GigPosting object.
      GigPosting gigPosting = GigPosting(
        title: title,
        description: description,
      );

      // Add the GigPosting object to the list of gig postings.
      gigPostings.add(gigPosting);
    }

    // Return the list of GigPosting objects.
    return gigPostings;
  }
}
