part of 'story_bloc.dart';

abstract class StoryEvent extends Equatable {
  const StoryEvent();
  factory StoryEvent.onSubscribed(User user) => Subscribed(user);
  factory StoryEvent.onStorySent(List<Story> stories) => StorySent(stories);
  @override
  List<Object?> get props => [];
}

class Subscribed extends StoryEvent {
  final User user;
  const Subscribed(this.user);

  @override
  List<Object?> get props => [user];
}

class StorySent extends StoryEvent {
  final List<Story> stories;
  const StorySent(this.stories);

  @override
  List<Object?> get props => [stories];
}

class _StoryReceived extends StoryEvent {
  final Story story;
  const _StoryReceived(this.story);

  @override
  List<Object?> get props => [story];
}
