part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();
  factory PostState.initial() => PostInitial();
  factory PostState.onPostSent(Post post) => PostSentSuccess(post);
  factory PostState.onPostReceived(Post post) => PostReceivedSuccess(post);
  @override
  List<Object?> get props => [];
}

class PostInitial extends PostState {}

class PostSentSuccess extends PostState {
  final Post post;
  const PostSentSuccess(this.post);

  @override
  List<Object?> get props => [post];
}

class PostReceivedSuccess extends PostState {
  final Post post;
  const PostReceivedSuccess(this.post);

  @override
  List<Object?> get props => [post];
}
