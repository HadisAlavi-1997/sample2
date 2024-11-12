abstract class UserProfileEvent {}

class ToggleBookmarkEvent extends UserProfileEvent {
  final bool isBookmarked;

  ToggleBookmarkEvent(this.isBookmarked);
}