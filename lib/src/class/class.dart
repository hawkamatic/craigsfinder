class MovingJob {
  final String title;
  final String location;
  final String description;
  final String price;

  MovingJob({this.title, this.location, this.description, this.price});

  factory MovingJob.fromJson(Map<String, dynamic> json) {
    return MovingJob(
      title: json['title'],
      location: json['location'],
      description: json['description'],
      price: json['price'],
    );
  }
}
