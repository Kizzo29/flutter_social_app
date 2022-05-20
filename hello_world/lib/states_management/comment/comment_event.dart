part of 'commentbloc.dart';

abstract class CommentEvent extends Equatable {
  const CommentEvent();
  factory CommentEvent.onSubscribed(Post post) => SubscribeToComments(post);
  factory CommentEvent.onCommentSent(List<Comment> comments) =>
      SendComments(comments);
  @override
  List<Object?> get props => [];
}

class SubscribeToComments extends CommentEvent {
  final Post post;
  const SubscribeToComments(this.post);
  @override
  List<Object?> get props => [post];
}

class SendComments extends CommentEvent {
  final List<Comment> comments;
  const SendComments(this.comments);

  @override
  List<Object?> get props => [comments];
}

class _ReceiveComments extends CommentEvent {
  final Comment comment;
  const _ReceiveComments(this.comment);

  @override
  List<Object?> get props => [comment];
}
