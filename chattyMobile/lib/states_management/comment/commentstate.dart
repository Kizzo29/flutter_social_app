part of 'commentbloc.dart';

abstract class CommentState extends Equatable {
  const CommentState();
  factory CommentState.Initial() => CommentsInitial();
  factory CommentState.CommentSent(Comment comment) =>
      CommentSentState(comment);
  factory CommentState.CommentReceived(Comment comment) =>
      CommentReceivedState(comment);
  @override
  List<Object?> get props => [];
}

class CommentsInitial extends CommentState {}

class CommentSentState extends CommentState {
  final Comment comment;
  const CommentSentState(this.comment);

  @override
  List<Object?> get props => [comment];
}

class CommentReceivedState extends CommentState {
  final Comment comment;
  const CommentReceivedState(this.comment);

  @override
  List<Object?> get props => [comment];
}
