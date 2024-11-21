import 'package:flutter/material.dart';
import '../../gen/assets.gen.dart';
import '../HomeScreeen/Post/postInformation.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz_rounded),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: (width > 330) ? 600: width,
          child: Stack(
            children: [Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 0, 16, 32),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(100, 0, 100, 20),
                      child: Row(

                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Assets.images.stories.story1
                                .image(width: 48, height: 48, fit: BoxFit.cover),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Richard Gervain',
                                style: themeData.textTheme.bodyLarge!
                                    .copyWith(fontWeight: FontWeight.w400),
                              ),
                              Text(
                                'Richard Gervain',
                                style: themeData.textTheme.bodyLarge!
                                    .copyWith(fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              const Text('UX Designer'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // قرار دادن Posts داخل `Expanded` برای جلوگیری از overflow
                Expanded(child: Posts(themeData: themeData, width: width, lable: 'MyPost', option: false,)),
              ],
            ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 116,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        themeData.colorScheme.surface,
                        themeData.colorScheme.surface.withOpacity(0),
                      ],
                    ),
                  ),
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}
