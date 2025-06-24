enum Typing { start, stop }

extension TypingParser on Typing {
  String value() {
    return this.toString().split('.').last;
  }

  static Typing fromString(String event) {
    return Typing.values.firstWhere((element) => element.value() == event);
  }
}

class TypingEvent {
 late String _id;
 String get id => _id;
 final String from;
 final String to;
 late String chatId;
 final Typing? event;

  TypingEvent(
      {this.event,
      required this.from,
      required this.to,
      required this.chatId});

  Map<String, dynamic> toJson() => {
        'event': this.event,
        'to': this.to,
        'from': this.from,
        'chatId': this.chatId
      };

  factory TypingEvent.fromJson(Map<String, dynamic> json) {
    var typing_event = TypingEvent(
        event: json['event'],
        from: json['from'],
        to: json['to'],
        chatId: json['chatId']);
    typing_event._id = json['id'];
    return typing_event;
  }
}
