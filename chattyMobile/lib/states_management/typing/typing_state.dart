part of 'typing_bloc.dart';

abstract class TypingState extends Equatable {
  const TypingState();
  factory TypingState.initial() => TypingInitial();
  factory TypingState.sent(List <TypingEvent> event) => TypingSentSuccess();
  factory TypingState.received(TypingEvent event) =>
      TypingReceivedSuccess(event);

  @override
  List<Object> get props => [];
}

class TypingInitial extends TypingState {}

class TypingSentSuccess extends TypingState {}


class TypingReceivedSuccess extends TypingState {
  final TypingEvent event;
  const TypingReceivedSuccess(this.event);

  @override
  List<Object> get props => [event];
}
