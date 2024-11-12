
// PostState.dart
abstract class PostState {}

class PostInitial extends PostState {
  final bool isBookmarked;
  PostInitial({required this.isBookmarked});
}

class PostLike extends PostState {
  final bool isLiked;
  PostLike({required this.isLiked});
}
