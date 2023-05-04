part of 'category_detail_bloc.dart';

@immutable
abstract class CategoryDetailEvent {}

class CategoryDetailLoaded extends CategoryDetailEvent {
  final String categoryId;

  CategoryDetailLoaded({required this.categoryId});
}
