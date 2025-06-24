class Comment {
  String get id => _id;
  final String contents;
  final String from;
  final String to;
  final DateTime time_record;
  late String _id;

  Comment({
    required this.contents,
    required this.to,
    required this.from,
    required this.time_record,
  });

  toJson() => {
        'contents': this.contents,
        'from': this.from,
        'time_record': this.time_record,
        'to': this.to,
      };

  factory Comment.fromJson(Map<String, dynamic> json) {
    var comment = Comment(
        contents: json['contents'],
        from: json['from'],
        to: json['to'],
        time_record: json['time_record']);

    comment._id = json['id'];
    return comment;
  }
}
