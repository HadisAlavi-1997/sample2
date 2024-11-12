// PostBloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'PostEvent.dart';
import 'PostState.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  // در ابتدا وضعیت شروع، تعیین می‌کنیم که آیا پست بوکمارک شده است یا خیر.
  PostBloc({required bool initialBookmarkState})
      : super(PostInitial(isBookmarked: initialBookmarkState)) {
    // ثبت هندلرهای رویدادها
    on<BookmarkEvent>((event, emit) {
      // هنگامی که BookmarkEvent دریافت می‌شود، وضعیت جدید ارسال می‌شود.
      emit(PostInitial(isBookmarked: event.isBookmarked));
    });

    on<LikeEvent>((event, emit) {
      // هنگامی که LikeEvent دریافت می‌شود، وضعیت لایک ارسال می‌شود.

      emit(PostLike(isLiked: event.isLike));
    });
  }
}
