part of "timeline.dart";

// Created using https://javiercbk.github.io/json_to_dart/

class Photo {
  final int userId;
  final int id;
  final String title;
  final String body;

  Photo({this.userId, this.id, this.title, this.body});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}