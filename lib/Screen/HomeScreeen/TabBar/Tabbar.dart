
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
import '../BasicPage.dart';

class tab extends StatelessWidget {
  const tab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: const Color(0xff376AED), // رنگ زیر تب
            indicatorWeight: 4, // ضخامت خط زیر تب
            labelColor: Colors.white, // رنگ متن فعال
            unselectedLabelColor: Colors.grey, // رنگ متن غیرفعال
            tabs: [
              Tab(child:  Assets.icons.home.image(width: 35,height: 35),),
              Tab(child: Assets.icons.search.image(width: 35,height: 35),),
              Tab(child:   Assets.icons.articles.image(width: 35,height: 35),),
              Tab(child:  Assets.icons.menu.image(width: 35,height: 35),),

            ],
          ),
        ),
        body: const SafeArea(
          child:
          TabBarView(
            children: [
              Center(child:basicPage(
                widthIcon: 50,
                heightIcon: 50,
                heightItemList: 110,
                profileImageWidth: 72,
                profileImageHeight: 72,
              )),
              Center(child: Text("Content 2")),
              Center(child: Text("Content 3")),
              Center(child: Text("Content 3")),

            ],
          ),

        ),
      ),
    );
  }
}
