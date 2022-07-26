part of 'tab_library_bloc.dart';

@immutable
abstract class TabLibraryEvent {}

class TabLibraryLoaded extends TabLibraryEvent {}

class TabLibraryChangeIndexChoice extends TabLibraryEvent {
  final int index;

  TabLibraryChangeIndexChoice({required this.index});
}

class TabLibraryChangeModelShow extends TabLibraryEvent {
  final bool isGrid;

  TabLibraryChangeModelShow({required this.isGrid});
}
