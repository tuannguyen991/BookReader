part of 'tab_home_bloc.dart';

@immutable
abstract class TabHomeEvent {}

class TabHomeLoaded extends TabHomeEvent {
}

class TabHomeIndexCarouselChange extends TabHomeEvent {
  final int index;

  TabHomeIndexCarouselChange({required this.index});
}