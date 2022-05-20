part of 'story_bloc.dart';

abstract class StoryState extends Equatable {
  const StoryState();
  factory StoryState.Initial() => StoryInitial();
  factory StoryState.onStorySent(Story story) => StorySentSuccess(story);
  factory StoryState.onStoryReceived(Story story) =>
      StoryReceivedSuccess(story);
  @override
  List<Object?> get props => [];
}

class StoryInitial extends StoryState {}

class StorySentSuccess extends StoryState {
  final Story story;
  const StorySentSuccess(this.story);

  @override
  List<Object?> get props => [story];
}

class StoryReceivedSuccess extends StoryState {
  final Story story;
  const StoryReceivedSuccess(this.story);

  @override
  List<Object?> get props => [story];
}
