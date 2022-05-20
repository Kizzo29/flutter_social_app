import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:social_media/social_media.dart';
import 'package:equatable/equatable.dart';
part 'comment_event.dart';
part 'commentstate.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentService _commentService;
  late StreamSubscription _subscription;

  CommentBloc(this._commentService) : super(CommentState.Initial());

  @override
  Stream<CommentState> mapEventToState(CommentEvent event) async* {
    if (event is SubscribeToComments) {
      await _subscription.cancel();
      _subscription = _commentService
          .receiveComment(post: event.post)
          .listen((comment) => add(_ReceiveComments(comment)));
    }

    if (event is _ReceiveComments) {
      yield CommentState.CommentReceived(event.comment);
    }

    if (event is SendComments) {
      final comment = await _commentService.addComment(event.comments);
      yield CommentState.CommentSent(comment);
    }
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    _commentService.dispose();
    return super.close();
  }
}
