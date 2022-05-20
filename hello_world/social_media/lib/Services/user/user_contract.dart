import 'package:social_media/Models/user.dart';

abstract class IUserService {
  Future<User> connect(User user);
  Future<List<User>> online();
  Future<void> disconnect(User user);
  Future<User> fetch_user({required String email, required User user});
  Future<void> add_friends({required User me, required String id});
  Future<void> follow({required User user, required String userId});
  Future<void> unfollow({required User me, required String toFollowId});
  Future<List<User>> fetchFollowers({required String userId});
  Future<List<User>> fetchFollows({required String userId});
  Future<List<User>> fetch(List<String> id);
  Future<List<User>> getFriends(String myId);
}
