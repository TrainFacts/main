part of "timeline.dart";

// Created using https://javiercbk.github.io/json_to_dart/

class Post {
  final String title;
  final String subtitle;
  final String body;
  final String date;
  final String time;
  final String image; // Check if this should be init as a String

  Post({this.title, this.subtitle, this.body, this.date, this.time, this.image});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      body: json['body'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
      image: json['image'] as String,
    );
  }
}

// Photo = Post
// fetchPhotos() = fetchPost()