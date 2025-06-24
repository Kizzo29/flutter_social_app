import 'dart:convert';
import 'package:social_media/social_media.dart';
import 'local_message.dart';

enum ChatType { individual, group }

extension EnumParsing on ChatType {
  String value() {
    return this.toString().split('.').last;
  }

  static ChatType fromString(String status) {
    return ChatType.values.firstWhere((element) => element.value() == status);
  }
}

class Chat {
  String id;
  ChatType type;
  List<Map> membersId;
  String? name;
  late int unread = 0;
  List<User>? members;
  List<LocalMessage>? messages = [];
  LocalMessage? mostRecent;
  late User from;

  Chat(this.id, this.type,
      {required this.membersId,
      this.members,
      this.name,
      this.messages,
      this.mostRecent});

  toMap() => {
        'id': id,
        'name': name,
        'type': type.value(),
        'members': membersId.map((e) => jsonEncode(e)).join(",")
      };

  factory Chat.fromMap(Map<String, dynamic> map) => Chat(
        map['id'],
        EnumParsing.fromString(map['type']),
        membersId:
            List<Map>.from(map['members'].split(",").map((e) => jsonDecode(e))),
        name: map['name'],
      );
}
