import 'package:bloc/bloc.dart';
import 'package:social_media/social_media.dart';

class FeedCubit extends Cubit<List<Post>> {
  final PostService _postService;
  FeedCubit(this._postService) : super([]);

  Future<void> posts(String myId) async {
    final posts = await _postService.getAllPosts(myId);
    emit(posts);
  }
}
