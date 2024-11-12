import 'package:flutter_bloc/flutter_bloc.dart';

import 'UserProfileEvent.dart';
import 'UserProfileState.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc({required bool initialBookmarkState})
      : super(UserProfileInitial(isBookmarked: initialBookmarkState)) {
    on<ToggleBookmarkEvent>((event, emit) {
      emit(UserProfileInitial(isBookmarked: event.isBookmarked));
    });
  }
}
