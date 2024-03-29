part of 'home_search_bloc.dart';

@immutable
abstract class HomeSearchEvent {}

class HomeSearchLoaded extends HomeSearchEvent {}

class HomeSearchDeleteHistoryItem extends HomeSearchEvent {
  final String name;

  HomeSearchDeleteHistoryItem({required this.name});
}

class HomeSearchGetRecommendedByName extends HomeSearchEvent {
  final String name;

  HomeSearchGetRecommendedByName({required this.name});
}
