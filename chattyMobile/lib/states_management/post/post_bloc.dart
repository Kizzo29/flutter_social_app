import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:social_media/social_media.dart';
import 'package:equatable/equatable.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostService _postService;
  late StreamSubscription _subscription;

  PostBloc(this._postService) : super(PostInitial());

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is Subscribed) {
      await _subscription.cancel();
      _subscription = _postService
          .receive(me: event.user)
          .listen((post) => add(_PostReceived(post)));
    }

    if (event is _PostReceived) {
      yield PostState.onPostReceived(event.post);
    }

    if (event is PostSent) {
      final postToSend = await _postService.send(event.posts);
      yield PostState.onPostSent(postToSend);
    }
  }

  @override
  Future<void> close() {
    _postService.dispose();
    _subscription.cancel();
    return super.close();
  }
}
