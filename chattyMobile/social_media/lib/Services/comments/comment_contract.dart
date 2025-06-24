import 'package:social_media/Models/comment.dart';
import 'package:social_media/Models/post.dart';

abstract class ICommentService {
  Future<Comment> addComment(List<Comment> comment);
  Stream<Comment> receiveComment({required Post post});
  Future<List<Comment>> getComments({required String postId});
  dispose();
}
