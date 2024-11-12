/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/Icons/category_1.png
  AssetGenImage get category1 =>
      const AssetGenImage('assets/Icons/category_1.png');

  /// File path: assets/Icons/category_2.png
  AssetGenImage get category2 =>
      const AssetGenImage('assets/Icons/category_2.png');

  /// File path: assets/Icons/category_3.png
  AssetGenImage get category3 =>
      const AssetGenImage('assets/Icons/category_3.png');

  /// File path: assets/Icons/category_4.png
  AssetGenImage get category4 =>
      const AssetGenImage('assets/Icons/category_4.png');

  /// File path: assets/Icons/notification.png
  AssetGenImage get notification =>
      const AssetGenImage('assets/Icons/notification.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [category1, category2, category3, category4, notification];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/Images/ImagesStory
  $AssetsImagesImagesStoryGen get imagesStory =>
      const $AssetsImagesImagesStoryGen();

  /// Directory path: assets/Images/posts
  $AssetsImagesPostsGen get posts => const $AssetsImagesPostsGen();

  /// Directory path: assets/Images/stories
  $AssetsImagesStoriesGen get stories => const $AssetsImagesStoriesGen();
}

class $AssetsImagesImagesStoryGen {
  const $AssetsImagesImagesStoryGen();

  /// File path: assets/Images/ImagesStory/hadis.jpg
  AssetGenImage get hadis =>
      const AssetGenImage('assets/Images/ImagesStory/hadis.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [hadis];
}

class $AssetsImagesPostsGen {
  const $AssetsImagesPostsGen();

  /// Directory path: assets/Images/posts/large
  $AssetsImagesPostsLargeGen get large => const $AssetsImagesPostsLargeGen();
}

class $AssetsImagesStoriesGen {
  const $AssetsImagesStoriesGen();

  /// File path: assets/Images/stories/story_1.jpg
  AssetGenImage get story1 =>
      const AssetGenImage('assets/Images/stories/story_1.jpg');

  /// File path: assets/Images/stories/story_2.jpg
  AssetGenImage get story2 =>
      const AssetGenImage('assets/Images/stories/story_2.jpg');

  /// File path: assets/Images/stories/story_3.jpg
  AssetGenImage get story3 =>
      const AssetGenImage('assets/Images/stories/story_3.jpg');

  /// File path: assets/Images/stories/story_4.jpg
  AssetGenImage get story4 =>
      const AssetGenImage('assets/Images/stories/story_4.jpg');

  /// File path: assets/Images/stories/story_5.jpg
  AssetGenImage get story5 =>
      const AssetGenImage('assets/Images/stories/story_5.jpg');

  /// File path: assets/Images/stories/story_6.jpg
  AssetGenImage get story6 =>
      const AssetGenImage('assets/Images/stories/story_6.jpg');

  /// File path: assets/Images/stories/story_7.jpg
  AssetGenImage get story7 =>
      const AssetGenImage('assets/Images/stories/story_7.jpg');

  /// File path: assets/Images/stories/story_8.jpg
  AssetGenImage get story8 =>
      const AssetGenImage('assets/Images/stories/story_8.jpg');

  /// List of all assets
  List<AssetGenImage> get values =>
      [story1, story2, story3, story4, story5, story6, story7, story8];
}

class $AssetsImagesPostsLargeGen {
  const $AssetsImagesPostsLargeGen();

  /// File path: assets/Images/posts/large/large_post_1.jpg
  AssetGenImage get largePost1 =>
      const AssetGenImage('assets/Images/posts/large/large_post_1.jpg');

  /// File path: assets/Images/posts/large/large_post_2.jpg
  AssetGenImage get largePost2 =>
      const AssetGenImage('assets/Images/posts/large/large_post_2.jpg');

  /// File path: assets/Images/posts/large/large_post_3.jpg
  AssetGenImage get largePost3 =>
      const AssetGenImage('assets/Images/posts/large/large_post_3.jpg');

  /// File path: assets/Images/posts/large/large_post_4.jpg
  AssetGenImage get largePost4 =>
      const AssetGenImage('assets/Images/posts/large/large_post_4.jpg');

  /// File path: assets/Images/posts/large/large_post_5.jpg
  AssetGenImage get largePost5 =>
      const AssetGenImage('assets/Images/posts/large/large_post_5.jpg');

  /// File path: assets/Images/posts/large/large_post_6.jpg
  AssetGenImage get largePost6 =>
      const AssetGenImage('assets/Images/posts/large/large_post_6.jpg');

  /// List of all assets
  List<AssetGenImage> get values =>
      [largePost1, largePost2, largePost3, largePost4, largePost5, largePost6];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
