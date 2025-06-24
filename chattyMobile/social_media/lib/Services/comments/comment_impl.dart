import 'dart:async';
import 'package:social_media/Models/post.dart';
import 'comment_contract.dart';
import 'package:social_media/Models/comment.dart';
import 'package:rethink_db_ns/rethink_db_ns.dart';

class CommentService implements ICommentService {
  final Connection _connection;
  final RethinkDb r;
  final _controller = StreamController<Comment>.broadcast();
  StreamSubscription? _changestream;

  CommentService(this.r, this._connection);

  @override
  dispose() {
    _changestream?.cancel();
    _controller.close();
  }

  @override
  Future<Comment> addComment(List<Comment> comment) async {
    var data = comment.map((e) => e.toJson()).toList();
    Map record = await r
        .table('comments')
        .insert(data, {'return_changes': true}).run(_connection);
    return Comment.fromJson(record['changes'].first['new_val']);
  }

  @override
  Stream<Comment> receiveComment({required Post post}) {
    _startReceivingComments(post);
    return _controller.stream;
  }

  _startReceivingComments(Post post) {
    _changestream = r
        .table('comments')
        .filter({'to': post.id})
        .changes({'include_initial': true})
        .run(_connection)
        .asStream()
        .cast<Feed>()
        .listen((event) {
          event
              .forEach((feedData) {
                if (feedData['new_val'] == null) return;
                final comment = _commentfromFeed(feedData);
                _controller.sink.add(comment);
              })
              .catchError((err) => print(err))
              .onError((error, stackTrace) => print(error));
        });
  }

  Comment _commentfromFeed(feedData) {
    var data = feedData['new_val'];
    return Comment.fromJson(data);
  }
  @override
  Future<List<Comment>> getComments(
      {required String postId}) async {
    Cursor comments =
        await r.table('comments').filter({'to': postId}).orderBy(r.desc('time_record')).run(_connection);
    List commentsList = await comments.toList();
    return commentsList.map((e) => Comment.fromJson(e)).toList();
  }
}
