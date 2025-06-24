class MessageGroup {
  String get id => _id;
  late String _id;
  List<String> members;
  String? photoUrl;
  String name;
  final String? description;
  final String? grouplink;
  late String _admin;
  String get admin => _admin;

  MessageGroup( 
      {
      this.grouplink,
      this.description,
      required this.members,
       this.photoUrl,
      required this.name,
      });

  toJson() => {
        'members': this.members,
        'photoUrl': this.photoUrl,
        'name': this.name,
        'grouplink': this.grouplink,
        
      };

  factory MessageGroup.fromJson(Map<String, dynamic> json) {
    var message_group = MessageGroup(
        members: List<String>.from(json['members']),
        photoUrl: json['photoUrl'],
        name: json['name'],
        grouplink: json['grouplink'],
      );
    message_group._admin = json['admin'];
    message_group._id = json['id'];
    return message_group;
  }
}
