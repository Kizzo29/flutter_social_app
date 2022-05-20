part of 'post_bloc.dart';

class PostEvent extends Equatable {
  const PostEvent();
  factory PostEvent.onSubscribed(User user) => Subscribed(user);
  factory PostEvent.onPostSent(List<Post> posts) => PostSent(posts);
  @override
  List<Object?> get props => [];
}

class Subscribed extends PostEvent {
  final User user;
  const Subscribed(this.user);

  @override
  List<Object?> get props => [user];
}

class PostSent extends PostEvent {
  final List<Post> posts;
  const PostSent(this.posts);

  @override
  List<Object?> get props => [posts];
}

class _PostReceived extends PostEvent {
  final Post post;
  const _PostReceived(this.post);

  @override
  List<Object?> get props => [post];
}
