import 'package:social_media/Models/user.dart';
import 'package:social_media/Services/user/user_contract.dart';
import 'package:rethink_db_ns/rethink_db_ns.dart';

class UserService implements IUserService {
  Connection _connection;
  RethinkDb r;

  var id;

  UserService(this._connection, this.r);
  @override
  Future<User> connect(User user) async {
    var userdata = user.toJson();
    if (userdata.id != null) userdata['id'] = user.id;

    final result = await r.table('users').insert(userdata, {
      'conflict': 'update',
      'return_changes': true,
    }).run(_connection);
    return User.fromJson(result['changes'].first['new_val']);
  }

  @override
  Future<List<User>> online() async {
    Cursor onlineusers =
        await r.table('users').filter({'active': true}).run(_connection);
    final userList = await onlineusers.toList();
    return userList.map((item) => User.fromJson(item)).toList();
  }

  @override
  Future<void> disconnect(User user) async {
    await r.table('users').update({
      'id': user.id,
      'active': false,
      'lastseen': DateTime.now()
    }).run(_connection);
    _connection.close();
  }

  @override
  Future<void> add_friends({required User me, required String id}) async {
    final myFriends = me.friends;
    final friend =
        await r.table('users').get(id).run(_connection);
    final new_friend = User.fromJson(friend);
    myFriends.add(new_friend.id);
  }

  @override
  Future<User> fetch_user({required String email, required User user}) async {
    final get_user = await r
        .table('users')
        .get(user.id)
        .filter({'email': email}).run(_connection);
    return User.fromJson(get_user);
  }

  @override
  Future<void> follow({required User user, required String userId}) async {
    final user_to_follow = await r.table('users').get(userId).run(_connection);
    var _userdata = User.fromJson(user_to_follow);
    _userdata.followers!.add(user.id);
  }

  @override
  Future<void> unfollow({required User me, required String toFollowId}) async {
    final user_to_unfollow =
        await r.table('users').get(toFollowId).run(_connection);
    var _userdata = User.fromJson(user_to_unfollow);
    _userdata.followers!.remove(me.id);
  }

  @override
  Future<List<User>> fetchFollowers({required String userId}) async {
    final followersList =
        await r.table('users').get(userId).filter('followers').run(_connection);
    List followers_list = await followersList.toList();

    return followers_list.map((e) => User.fromJson(e)).toList();
  }

  @override
  Future<List<User>> fetchFollows({required String userId}) async {
    final followsList = await r
        .table('users')
        .get(userId)
        .filter({'follows'}).run(_connection);
    List follows_list = await followsList.toList();

    return follows_list.map((e) => User.fromJson(e)).toList();
  }

  @override
  Future<List<User>> fetch(List<String> id) async {
    final users = await r
        .table('users')
        .getAll(r.args(id))
        .filter({'active': true}).run(_connection);

    List usersList = await users.toList();
    return usersList.map((e) => User.fromJson(e)).toList();
  }

  @override
  Future<List<User>> getFriends(String myId) async {
    final my_user = await r.table('users').get(myId).run(_connection);
    final me_user = User.fromJson(my_user);
    List myFriendsIds = me_user.friends;
    return myFriendsIds.map((e) => User.fromJson(e)).toList();
  }
}
