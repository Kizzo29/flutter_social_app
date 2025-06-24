import 'package:flutter/foundation.dart';
class Story {
  String get id => _id;
  final String contents;
  final String from;
  List<String> views;
  final String to;
  final DateTime time_record;
  List<String> likes;
  late String _id;

  Story(
      {
      required this.views,
      required this.likes,
      required this.contents,
      required this.from,
      required this.to,
      required this.time_record});

  toJson() => {
        'views': this.views,
        'contents': this.contents,
        'from': this.from,
        'to': this.to,
        'time_record': this.time_record,
        'likes': this.likes,
      };

  factory Story.fromJson(Map<String, dynamic> json) {
    var story = Story(
        contents: json['contents'],
        views: json['views'],
        from: json['from'],
        to: json['to'],
        likes: json['likes'],
        time_record: json['time_record']);

    story._id = json['id'];
    return story;
  }
}
