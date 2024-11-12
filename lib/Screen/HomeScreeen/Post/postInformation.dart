import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/Source/DataFile.dart';
import 'PostBloc.dart';
import 'PostEvent.dart';
import 'PostState.dart';

class Posts extends StatelessWidget {
  final ThemeData themeData;
  final double width;

  const Posts({
    super.key,
    required this.post,
    required this.themeData,
    required this.width,
  });

  final List<PostData> post;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          PostBloc(initialBookmarkState: false), // وضعیت ابتدایی بوک‌مارک
      child: BlocConsumer<PostBloc, PostState>(
        listener: (BuildContext context, state) {
          // شنونده‌ای در اینجا نیاز نیست، می‌توانید این قسمت را حذف کنید
        },
        builder: (BuildContext context, state) {
          return ListView.builder(
            itemCount: post.length,
            itemExtent: 141,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              // دسترسی به وضعیت بوک‌مارک و لایک
              bool isBookmarked = post[index].isBookmarked;
              bool isLikee = post[index].isLike;

              return Container(
                margin: EdgeInsets.fromLTRB(32, 10, 32, 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(color: Color(0x1a5282ff), blurRadius: 10)
                    ]
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      child: Image.asset(
                        'assets/Images/posts/small/${post[index].imageFileName}',
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(
                            width > 1024 ? width * 0.3 : width * 0.09,
                            0,
                            width > 1024 ? width * 0.01 : 8,
                            0
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              post[index].caption,
                              style: themeData.textTheme.labelMedium,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              post[index].title,
                              style: themeData.textTheme.titleSmall,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    // تغییر وضعیت لایک و ارسال رویداد به بلوک
                                    post[index].isLike = !isLikee;
                                    post[index].likeNumber =
                                    post[index].isLike
                                        ? post[index].likeNumber + 1
                                        : post[index].likeNumber - 1;
                                    BlocProvider.of<PostBloc>(context).add(
                                      LikeEvent(
                                        isLike: post[index].isLike,
                                        postIndex: index, // ارسال اندیس پست برای شناسایی
                                      ),
                                    );
                                  },
                                  child: Icon(
                                    post[index].isLike
                                        ? CupertinoIcons.hand_thumbsup_fill
                                        : CupertinoIcons.hand_thumbsup,
                                    size: 16,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(post[index].likeNumber.toString()),
                                const SizedBox(width: 16),
                                const Icon(CupertinoIcons.clock, size: 16),
                                const SizedBox(width: 4),
                                Text(post[index].time),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    child: GestureDetector(
                                      onTap: () {
                                        post[index].isBookmarked =
                                        !isBookmarked;

                                        // ارسال رویداد BookmarkEvent به بلوک
                                        BlocProvider.of<PostBloc>(context)
                                            .add(BookmarkEvent(
                                          isBookmarked: post[index].isBookmarked,
                                        ));
                                      },
                                      child: Icon(
                                        post[index].isBookmarked
                                            ? CupertinoIcons.bookmark_fill
                                            : CupertinoIcons.bookmark,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}