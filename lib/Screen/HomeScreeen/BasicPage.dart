import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myrezome/Screen/HomeScreeen/Post/postInformation.dart';
import '../../carousel/carousel_slider.dart';
import 'UserProfile/UserProfile.dart';
import '../../data/Source/DataFile.dart';
import '../../gen/assets.gen.dart';
import 'BlocHomeScreen/BlocHome.dart';
import 'BlocHomeScreen/StatesHome.dart';


class basicPage extends StatelessWidget {
  final double widthIcon;
  final double heightIcon;
  final double heightItemList;
  final double profileImageWidth;
  final double profileImageHeight;

  const basicPage({
    super.key,
    required this.widthIcon,
    required this.heightIcon,
    required this.heightItemList,
    required this.profileImageWidth,
    required this.profileImageHeight,
  });

  @override
  Widget build(BuildContext context) {
    final categories = AppDatabase.categories;

    final ThemeData themeData = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    return  SingleChildScrollView(

    physics: const BouncingScrollPhysics(),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 50, 32, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hi, Alavi ",
                  style: themeData.textTheme.titleLarge,
                ),
                Assets.icons.notification
                    .image(width: widthIcon, height: heightIcon)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 15, 0, 15),
            child: Text(
              'Explore todays',
              style: width > 1024
                  ? themeData.textTheme.headlineMedium!.apply(
                      fontSizeFactor: 1.2,
                    )
                  : themeData.textTheme.headlineMedium,
            ),
          ),
          BlocBuilder<BlocHome, StatesHome>(
              builder: (BuildContext context, StatesHome state) {
            if (state is HomeLoaded) {
              return Column(
                children: [
                  _listProfileUser(
                    heightItemList,
                    profileImageWidth,
                    profileImageHeight,
                  ),
                  _listCategory(categories, themeData),
                  _postList(themeData ,width ),
                  const SizedBox(height: 30,)
                ],
              );
            }
            return const Center(
              child: Text('this is an Error'), // نمایش خطا در صورت بروز مشکل
            );
          }),
        ],
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
Widget _listProfileUser(heightItemList, profileImageWidth, profileImageHeight) {
  final stories = AppDatabase.stories;

  return Builder(builder: (context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: heightItemList,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        //کش سانی کردن لیست
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        itemBuilder: (context, index) {
          final story = stories[index];
          return Padding(

            padding: EdgeInsets.fromLTRB(32, 0, 0, 0),
            child: Userprofile(
              images: story.imageFileName,
              icon: story.iconFileName,
              name: story.name,
              profileImageWidth: profileImageWidth,
              profileImageHeight: profileImageHeight,
            ),
          );
        },
      ),
    );
  });
}

////////////////////////////////////////////////////////////////////////////////////////
Widget _listCategory(categories, themeData) {
  return LayoutBuilder(
    builder: (context, constraints) {
      // عرض صفحه نمایش را می‌گیریم
      double width = constraints.maxWidth;

      return CarouselSlider.builder(
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return Container(
            margin: EdgeInsets.fromLTRB(realIndex == 0 ? 32 : 8, 0,
                realIndex == categories.length - 1 ? 32 : 8, 0), //left & right
            child: Stack(children: [
              Positioned.fill(
                   left:width>1024 ?86:50,
                 right: width>1024 ?86:50,
                  top:width>1024 ?50:20,
                  bottom:width>1024 ?40:10,

                  child: Container(
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(blurRadius: 20, color: Color(0xaa0D253C))
                    ]),
                  )),
              Positioned.fill(
                //حالاContainer کل فضارا میگیرد
                child: Container(
                  margin: width > 1024
                      ? const EdgeInsets.fromLTRB(0, 10, 40, 50)
                      : EdgeInsets.fromLTRB(0, 20, 0, 15),
                  // left, top, right, bottom)حاشیه بزرگتر برای دسکتاپ
                  foregroundDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    gradient: const LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [Color(0xff0D253C), Colors.transparent],
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: Image.asset(
                      'assets/Images/posts/large/${categories[index].imageFileName}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 80,
                  left: 50,
                  child: Text(categories[index].title,
                      style: width > 1024
                          ? themeData.textTheme.headlineMedium!.apply(
                              color: Colors.white,
                            )
                          : themeData.textTheme.headlineSmall!.apply(
                              color: Colors.white,
                            )))
            ]),
          );
        },
        options: CarouselOptions(
            scrollDirection: Axis.horizontal,
            viewportFraction: width > 1024 ? 0.4 : 0.8,
            // تنظیم برای دسکتاپ (برای نمایش بزرگتر هر آیتم)
            aspectRatio: width > 1024 ? 1.6 : 1.2,
            // نسبت ابعاد برای دسکتاپ
            initialPage: 0,
            disableCenter: true,
            // این اگرtrue باشه enlargeStrategy کارخواهد کرد
            enableInfiniteScroll: false,
            // غیرفعال کردن اسکرول بی‌پایان
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            enlargeCenterPage: true,
            //ایتم وسط را بزرگ میکند
            scrollPhysics: BouncingScrollPhysics()),
      );
    },
  );
}

//////////////////////////////////////////////////////////////////////////////////////
Widget _postList(ThemeData themeData,width) {
  return Builder(builder: (context) {

    final post = AppDatabase.posts;
    return Column(children: [
      Padding(
        padding: EdgeInsets.fromLTRB(32, 10, 24, 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center, //تراز میکنه
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "LatestNews",
              style: themeData.textTheme.bodyLarge,
            ),
            TextButton(
                onPressed: () {},
                child: const Text("More",
                    style: TextStyle(color: Color(0xff376AED))))
          ],
        ),
      ),
      Posts(post: post, themeData: themeData, width: width)
    ]);
  });
}
