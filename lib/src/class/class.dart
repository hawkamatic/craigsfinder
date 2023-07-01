class MovingJob {
  final String title;
  final String location;
  final String description;
  final String price;

  MovingJob(
      {required this.title,
      required this.location,
      required this.description,
      required this.price});

  factory MovingJob.fromJson(Map<String, dynamic> json) {
    return MovingJob(
      title: json['title'],
      location: json['location'],
      description: json['description'],
      price: json['price'],
    );
  }
}
