class Post {
  String to;
  String from;
  List<String>? likes;
  int comments;
  String contents;
  final DateTime time_record;
  late String _id;
  String get id => _id;

  Post(
      {required this.to,
      required this.contents,
      required this.time_record,
      required this.comments,
      required this.from,
      this.likes});

  toJson() => {
        'to': to,
        'from': from,
        'contents': contents,
        'comments': comments,
        'likes': likes,
        'time_record': time_record,
      };

  factory Post.fromJson(Map<String, dynamic> json) {
    var post = Post(
        to: json['to'],
        from: json['from'],
        contents: json['contents'],
        comments: json['comments'],
        likes: json['likes'],
        time_record: json['time_record']);
    post._id = json['id'];

    return post;
  }
}
