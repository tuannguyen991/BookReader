part of 'library_upload_bloc.dart';

@immutable
abstract class LibraryUploadEvent {}

class LibraryUploadLoaded extends LibraryUploadEvent {}

class LibraryUploadSave extends LibraryUploadEvent {
  final String title;
  final String author;
  final String description;
  LibraryUploadSave(
      {required this.title, required this.author, required this.description});
}

class LibraryUploadEpub extends LibraryUploadEvent {
  final String linkEpub;
  LibraryUploadEpub({required this.linkEpub});
}
