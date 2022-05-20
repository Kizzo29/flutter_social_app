import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:social_media/social_media.dart';

part 'messagestate.dart';
part 'messagevent.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  final IMessageService _messageService;
  late StreamSubscription _subscription;

  MessageBloc(this._messageService) : super(MessageState.initial());

  @override
  Stream<MessageState> mapEventToState(MessageEvent event) async* {
    if (event is Subscribed) {
      await _subscription.cancel();
      _subscription = _messageService.messages(activeUser: event.user).listen(
          (message) => add(_MessageReceived(message)));
    }

    if (event is _MessageReceived) {
      yield MessageState.received(event.message);
    }

    if (event is MessageSent) {
      final message = await _messageService.send(event.message);
      yield MessageState.sent(message);
    }
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    _messageService.dispose();
    return super.close();
  }
}
