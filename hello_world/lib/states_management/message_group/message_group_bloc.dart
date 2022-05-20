import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:social_media/social_media.dart';

part 'message_event.dart';
part 'message_group_state.dart';

class MessageGroupBloc extends Bloc<MessageGroupEvent, MessageGroupState> {
  final MessageGroupService _groupService;
  late StreamSubscription _subscription;

  MessageGroupBloc(this._groupService) : super(MessageGroupState.initial());

  @override
  Stream<MessageGroupState> mapEventToState(MessageGroupEvent event) async* {
    if (event is Subscribed) {
      await _subscription.cancel();
      _subscription = _groupService
          .rooms(me: event.user)
          .listen((room) => add(_MessageGroupReceived(room)));
    }

    if (event is _MessageGroupReceived) {
      yield MessageGroupState.received(event.group);
    }

    if (event is MessageGroupCreated) {
      final messageGroup = await _groupService.create(event.user.id, event.group);
      yield MessageGroupState.created(messageGroup);
    }
  }

  @override
  Future<void> close() {
    print('disposing');

    _subscription.cancel();
    _groupService.dispose();
    return super.close();
  }
}
