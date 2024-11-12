
// PostEvent.dart
abstract class PostEvent {}

class BookmarkEvent extends PostEvent {
  final bool isBookmarked;
  BookmarkEvent({required this.isBookmarked});
}

class LikeEvent extends PostEvent {
  final bool isLike;
  final int postIndex;

  LikeEvent({required this.isLike, required this.postIndex});
}