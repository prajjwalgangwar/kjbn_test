abstract class HomeEvent {}

class InitialHomeEvent extends HomeEvent {}

class TapEvent extends HomeEvent {
  int currentSecond;
  TapEvent({required this.currentSecond});
}

class NoActionEvent extends HomeEvent {}
