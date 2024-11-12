class StoryData {
  final int id;
  final String name;
  final String imageFileName;
  final String iconFileName;
  final bool isViewed;

  StoryData(
      {required this.id,
        required this.name,
        required this.imageFileName,
        required this.iconFileName,
        required this.isViewed});
}

class Category {
  final int id;
  final String title;
  final String imageFileName;

  Category(
      {required this.id, required this.title, required this.imageFileName});
}

class PostData {
  final String imageFileName;
  final String caption;
  final String title;

  final String time;
  bool isBookmarked;
  bool isLike;
  int likeNumber;

  PostData({
    required this.imageFileName,
    required this.caption,
    required this.title,

    required this.time,
    this.isBookmarked = false,
    this.isLike = false,
    required int id,
    this.likeNumber=0,// مقدار پیش‌فرض بوک‌مارک
  });
}

class AppDatabase {
  static List<StoryData> get stories {
    return [
      StoryData(
          id: 1001,
          name: 'Emilia',
          imageFileName: 'assets/Images/stories/story_1.jpg',
          iconFileName: 'assets/Icons/category_1.png',
          isViewed: false),
      StoryData(
          id: 1002,
          name: 'Richard',
          imageFileName: 'assets/Images/stories/story_2.jpg',
          iconFileName: 'assets/Icons/category_2.png',
          isViewed: false),
      StoryData(
          id: 1003,
          name: 'Jasmine',
          imageFileName: 'assets/Images/stories/story_3.jpg',
          iconFileName: 'assets/Icons/category_3.png',
          isViewed: true),
      StoryData(
          id: 1004,
          name: 'Lucas',
          imageFileName: 'assets/Images/stories/story_4.jpg',
          iconFileName: 'assets/Icons/category_4.png',
          isViewed: false),
      StoryData(
          id: 1005,
          name: 'Hendri',
          imageFileName: 'assets/Images/stories/story_5.jpg',
          iconFileName: 'assets/Icons/category_2.png',
          isViewed: false),
      StoryData(
          id: 1006,
          name: 'Hendri',
          imageFileName: 'assets/Images/stories/story_6.jpg',
          iconFileName: 'assets/Icons/category_1.png',
          isViewed: false),
      StoryData(
          id: 1007,
          name: 'Hendri',
          imageFileName: 'assets/Images/stories/story_7.jpg',
          iconFileName: 'assets/Icons/category_4.png',
          isViewed: false),
      StoryData(
          id: 1008,
          name: 'Hendri',
          imageFileName: 'assets/Images/stories/story_8.jpg',
          iconFileName: 'assets/Icons/category_3.png',
          isViewed: false),
    ];
  }


  static List<Category> get categories {
    return [
      Category(
        id: 101,
        title: 'Technology',
        imageFileName: 'large_post_1.jpg',
      ),
      Category(id: 102, title: 'Cinema', imageFileName: 'large_post_2.jpg'),
      Category(
          id: 103, title: 'Transportation', imageFileName: 'large_post_3.jpg'),
      Category(id: 104, title: 'Adventure', imageFileName: 'large_post_4.jpg'),
      Category(
          id: 105,
          title: 'Artificial Intelligence',
          imageFileName: 'large_post_5.jpg'),
      Category(id: 106, title: 'Economy', imageFileName: 'large_post_6.jpg'),
    ];
  }

  static List<PostData> posts = [
    PostData(
        id: 1,
        title: 'BMW M5 Competition Review 2021',
        caption: 'TOP GEAR',

        time: '1hr ago',
        imageFileName: 'small_post_1.jpg',
        likeNumber: 3100), // فرض کنید تعداد لایک‌ها به شکل عددی است
    PostData(
        id: 0,
        title: 'MacBook Pro with M1 Pro and M1 Max review',
        caption: 'THE VERGE',
        time: '2hr ago',
        imageFileName: 'small_post_2.jpg',
        likeNumber: 1200),
    PostData(
        id: 2,
        title: 'Step design sprint for UX beginner',
        caption: 'Ux Design',

        time: '41hr ago',
        imageFileName: 'small_post_3.jpg',
        likeNumber: 2000),
  ];
  // متد برای شمارش تعداد لایک‌ها
  static int getTotalLikes() {
    int totalLikes = 0;
    for (var post in posts) {
      if (post.isLike) {
        totalLikes += post.likeNumber;
      }
    }
    return totalLikes;
  }
}

void main() {
  // استفاده از متد برای محاسبه تعداد کل لایک‌ها
  int totalLikes = AppDatabase.getTotalLikes();
  print('Total Likes: $totalLikes');
}


