import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:social_media/social_media.dart';

part 'typing_state.dart';
part 'typing_event.dart';

class TypingNotificationBloc
    extends Bloc<TypingNotificationEvent, TypingState> {
  final ITypingNotification _typingService;
  late StreamSubscription? _subscription;

  TypingNotificationBloc(this._typingService) : super(TypingState.initial());

  @override
  Stream<TypingState> mapEventToState(
      TypingNotificationEvent typingEvent) async* {
    if (typingEvent is Subscribed) {
      if (typingEvent.usersWithChat == null) {
        add(NotSubscribed());
        return;
      }
      await _subscription?.cancel();
      _subscription = _typingService
          .subscribe(typingEvent.user, typingEvent.usersWithChat!)
          .listen((typingEvent) => add(_TypingReceived(typingEvent)));
    }

    if (typingEvent is _TypingReceived) {
      yield TypingState.received(typingEvent.event);
    }

    if (typingEvent is TypingSent) {
      await _typingService.send(event: typingEvent.event);
      yield TypingState.sent(typingEvent.event);
    }

    if (typingEvent is NotSubscribed) {
      yield TypingState.initial();
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    _typingService.dispose();
    return super.close();
  }
}
