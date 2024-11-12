abstract class UserProfileState {}

class UserProfileInitial extends UserProfileState {
  final bool isBookmarked;

  UserProfileInitial({required this.isBookmarked});
}
