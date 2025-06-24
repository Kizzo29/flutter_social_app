class User {
  String username;
  bool active;
  String? photourl;
  String email_address;
  List<String>? follows;
  List<String>? followers;
  List<String>? posts;
  DateTime lastseen;
  List<String> friends;

  late String _id;
  String get id => _id;

  User(
      {this.followers,
      this.follows,
      required this.email_address,
      this.posts,
      required this.active,
      required this.friends,
      required this.lastseen,
      this.photourl,
      required this.username});

  toJson() => {
        'active': active,
        'lastseen': lastseen,
        'photourl': photourl,
        'username': username,
        'friends': friends,
        'posts': posts,
        'email': email_address,
        'follows': follows,
        'followers': followers,
      };

  factory User.fromJson(Map<String, dynamic> json) {
    var user = User(
        active: json['active'],
        lastseen: json['lastseen'],
        photourl: json['photourl'],
        username: json['username'],
        email_address: json['email'],
        friends: List<String>.from(json['friends']),
        followers: List<String>.from(json['followers']),
        follows: List<String>.from(json['follows']),
        posts: List<String>.from(json['posts']));

    user._id = json['id'];
    return user;
  }

  @override
  bool operator ==(Object other) => other is User && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
