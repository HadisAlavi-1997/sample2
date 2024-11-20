import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'UserProfileBloc.dart';
import 'UserProfileEvent.dart';
import 'UserProfileState.dart';
import 'package:dotted_border/dotted_border.dart';

class Userprofile extends StatelessWidget {
  final String images;
  final String icon;
  final String name;
  final double profileImageWidth;
  final double profileImageHeight;

  const Userprofile({
    super.key,
    required this.images,
    required this.icon, required this.name, required this.profileImageWidth, required this.profileImageHeight,
  });

  @override
  Widget build(BuildContext context) {
    bool isBookmarked = false;
    return BlocProvider(
      create: (context) => UserProfileBloc(initialBookmarkState: isBookmarked),
      child: BlocConsumer<UserProfileBloc, UserProfileState>(
        listener: (context, state) {
          if (state is UserProfileInitial) {
            isBookmarked = state.isBookmarked;
          }
        },
        builder: (context, state) {
          if (state is UserProfileInitial) {
            isBookmarked = state.isBookmarked;
          }

          return Column(

            children: [
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {

                      // ارسال رویداد به بلاک برای تغییر حالت
                      BlocProvider.of<UserProfileBloc>(context).add(
                        ToggleBookmarkEvent(!isBookmarked),
                      );
                      !isBookmarked
                      ?
                      // نمایش تصویر کامل‌صفحه در دیالوگ
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Center(
                            child: Container(
                              padding: EdgeInsets.all(5),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.asset(
                                  images,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    // اگر خطایی در لود تصویر وجود داشته باشد
                                    debugPrint('Error loading image: $error');
                                    return Icon(Icons.error); // نمایش یک آیکون در صورت خطا
                                  },
                                ),
                              )
                              ,
                            ),
                          );
                        },
                      ):const Text('data');
                    },
                    child:
                    isBookmarked
                        ? _profileImageViewed(images, isBookmarked,profileImageWidth,profileImageHeight)
                        : _profileImageUnViewed(images, isBookmarked,profileImageWidth,profileImageHeight),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    width: 25,
                    height: 25,
                    child: Image.asset(icon),
                  ),
                ],
              ),
              Text(
                name,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          );
        },
      ),
    );
  }
}
//////////////////////////////////////////////////////////////////////////////

Container _profileImageUnViewed(String images, bool isBookmarked,profileImageWidth,profileImageHeight) {
  return Container(
    margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
    height: profileImageWidth,
    width: profileImageHeight,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(22),
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        colors: [
          CupertinoColors.systemBlue,
          Color(0xFF5CA9EF),
          Color(0xFFA9C6EF),
        ],
      ),
    ),
    child: Container(
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: _profileImage(images, isBookmarked),
    ),
  );
}

//////////////////////////////////////////////////////////////////////////////////
Container _profileImageViewed(String images, bool isBookmarked,profileImageWidth,profileImageHeight) {
  return Container(
    margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
    height: profileImageHeight,
    width: profileImageWidth,
    child: DottedBorder(
      borderType: BorderType.RRect,
      strokeWidth: 2,
      radius: const Radius.circular(22),
      color: const Color(0xff7B8BB2),
      dashPattern: const [8, 4],
      padding: const EdgeInsets.all(2),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
        ),
        child: _profileImage(images, isBookmarked),
      ),
    ),
  );
}

//////////////////////////////////////////////////////////////////////////////////

Container _profileImage(String images, bool isBookmarked) {
  return Container(
    margin: EdgeInsets.all(5),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Image.asset(
        images,
        fit: BoxFit.cover,
      ),
    ),
  );
}
