import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Container(
        height: 85,

        child: Stack(children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [

                        Assets.icons.home.image(),
                        Text("Home",style:themeData.textTheme.bodySmall ,),
                      ],
                    ), Column(
                      children: [

                        Assets.icons.articles.image(),
                        Text("Article",style:themeData.textTheme.bodySmall ,),
                      ],
                    ),SizedBox(width: 20,),
                    Column(
                      children: [

                        Assets.icons.search.image(),
                        Text("Search",style:themeData.textTheme.bodySmall ,),
                      ],
                    ), Column(
                      children: [

                        Assets.icons.menu.image(),
                        Text("Menu",style:themeData.textTheme.bodySmall ,),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Center(
              child: Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
                color: Color(0xff376AED),
                borderRadius: BorderRadius.circular(32)),
                child:Assets.icons.plus.image()
              )
          )
        ]));
  }
}
