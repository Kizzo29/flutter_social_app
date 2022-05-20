class Message {
  String get id => _id;
  final String contents;
  final String from;
  final String to;
  final DateTime time_record;
  String? roomId;
  late String _id;

  Message(
      {required this.contents,
      required this.from,
      required this.to,
      required this.time_record,
      this.roomId});

  toJson() => {
        'contents': this.contents,
        'from': this.from,
        'to': this.to,
        'time_record': this.time_record,
        'roomId': this.roomId
      };

  factory Message.fromJson(Map<String, dynamic> json) {
    var message = Message(
        contents: json['contents'],
        from: json['from'],
        to: json['to'],
        roomId: json['roomId'],
        time_record: json['time_record']);

    message._id = json['id'];
    return message;
  }
}
