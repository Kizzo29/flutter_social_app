import 'package:bloc/bloc.dart';
import 'package:social_media/social_media.dart';

class CommentThreadCubit extends Cubit<List<Comment>> {
  final CommentService _commentService;
  CommentThreadCubit(this._commentService) : super([]);

  Future<void> comments(String postId) async {
    final comments = await _commentService.getComments(postId: postId);
    emit(comments);
  }
}
