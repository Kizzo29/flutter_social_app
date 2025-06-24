part of 'typing_bloc.dart';

abstract class TypingNotificationEvent extends Equatable {
  const TypingNotificationEvent();
  factory TypingNotificationEvent.onSubscribed(User user,
          {List<String>? usersWithChat}) =>
      Subscribed(user, usersWithChat: usersWithChat);
  factory TypingNotificationEvent.onTypingSent(List<TypingEvent> event) =>
      TypingSent(event);
  @override
  List<Object> get props => [];
}

class Subscribed extends TypingNotificationEvent {
  final User user;
  final List<String>? usersWithChat;
  const Subscribed(this.user, { this.usersWithChat});

  @override
  List<Object> get props => [user, usersWithChat!];
}

class NotSubscribed extends TypingNotificationEvent {}

class TypingSent extends TypingNotificationEvent {
  final List<TypingEvent> event;
  const TypingSent(this.event);

  @override
  List<Object> get props => [event];
}

class _TypingReceived extends TypingNotificationEvent {
  const _TypingReceived(this.event);
  final TypingEvent event;

  @override
  List<Object> get props => [event];
}
