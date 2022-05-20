import 'dart:async';

import 'package:social_media/Models/user.dart';
import 'package:social_media/Models/post.dart';
import 'package:social_media/Services/posts/post_contract.dart';
import 'package:rethink_db_ns/rethink_db_ns.dart';

class PostService implements IPostService {
  RethinkDb r;
  Connection _connection;

  final _controller = StreamController<Post>.broadcast();
  StreamSubscription? _subscription;

  PostService(this._connection, this.r);

  @override
  Future<List<Post>> fetch(
      {required String userId, Post? post}) async {
    Cursor posts = await r
        .table('posts')
        .filter({'from': userId}).orderBy(r.desc('time_record')).run(_connection);
    List postsList = await posts.toList();
    return postsList.map((e) => Post.fromJson(e)).toList();
  }

  @override
  Future<void> like(Post post, String myId) async {
    await r
        .table('posts')
        .update({'likes': post.likes!.add(myId)}).run(_connection);
  }

  @override
  Stream<Post> receive({required User me}) {
    _startReceivingPosts(me);
    return _controller.stream;
  }

  _startReceivingPosts(User me) {
    _subscription = r
        .table('posts')
        .filter({'to': me.id})
        .changes({'include_initial': true})
        .run(_connection)
        .asStream()
        .cast<Feed>()
        .listen((event) {
          event
              .forEach((feedData) {
                if (feedData['new_val'] == null) return;

                final message = _postFromFeed(feedData);
                _controller.sink.add(message);
              })
              .catchError((err) => print(err))
              .onError((error, stackTrace) => print(error));
        });
  }

  Post _postFromFeed(feedData) {
    var data = feedData['new_val'];

    return Post.fromJson(data);
  }

  @override
  Future<Post> send(List<Post> post) async {
    var data = post.map((e) => e.toJson()).toList();

    Map newPost = await r
        .table('posts')
        .insert(data, {'return_changes': true}).run(_connection);
    return Post.fromJson(newPost['changes'].first['new_val']);
  }

  @override
  dispose() {
    _controller.close();
    _subscription?.cancel();
  }

  @override
  Future<List<Post>> getAllPosts(String myId) async {
    Cursor allPosts = await r
        .table('posts')
        .filter({"to": myId}).orderBy(r.desc('time_record')).run(_connection);
    List myFeedPosts = await allPosts.toList();
    return myFeedPosts.map((e) => Post.fromJson(e)).toList();
  }
}
