import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:social_media/social_media.dart';
import 'package:equatable/equatable.dart';
part 'story_state.dart';
part 'story_event.dart';

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  final StoryService _storyService;
  late StreamSubscription _subscription;

  StoryBloc(this._storyService) : super(StoryInitial());

  @override
  Stream<StoryState> mapEventToState(StoryEvent event) async* {
    if (event is Subscribed) {
      await _subscription.cancel();
      _subscription = _storyService
          .receiving(OnlineUser: event.user)
          .listen((story) => add(_StoryReceived(story)));
    }

    if (event is _StoryReceived) {
      yield StoryState.onStoryReceived(event.story);
    }

    if (event is StorySent) {
      final storyToSend = await _storyService.send(event.stories);
      yield StoryState.onStorySent(storyToSend);
    }
  }

  @override
  Future<void> close() {
    _storyService.dispose();
    _subscription.cancel();
    return super.close();
  }
}
