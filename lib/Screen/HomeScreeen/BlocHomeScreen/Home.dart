import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../Menu/Menu.dart';
import '../BasicPage.dart';
import '../NavigationBar/Navigation.dart';
import 'BlocHome.dart';
import 'EventsHome.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      backgroundColor:themeData.colorScheme.surface ,
        body: BlocProvider<BlocHome>(
      create: (BuildContext context) =>
          BlocHome()..add(StartHome()), // ارسال رویداد آغاز

      child: ResponsiveBuilder(
        builder: (context, sizingInformation) {
          if (sizingInformation.isMobile) {
            return _buildPhoneLayout();
          } else if (sizingInformation.isTablet) {
            return _buildTabletLayout();
          } else {
            return _buildDesktopLayout();
          }
        },
      ),
    ));
  }

  Widget _buildPhoneLayout() {
    return  Scaffold(
      body: SafeArea(
          child: Stack(children: [
        basicPage(
          widthIcon: 30,
          heightIcon: 30,
          heightItemList: 90,
          profileImageWidth: 64,
          profileImageHeight: 64,
        ),
            Positioned(
              bottom: 0,
                left: 0,
                right: 0,

                child: Navigation())
      ])),
    );
  }

  Widget _buildTabletLayout() {
    return  Scaffold(
      body: SafeArea(
          child: Stack(
            children: [basicPage(
                    widthIcon: 40,
                    heightIcon: 40,
                    heightItemList: 100,
                    profileImageWidth: 68,
                    profileImageHeight: 68,
                  ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,

                  child: Navigation())
            ]
          )),
    );
  }

  Widget _buildDesktopLayout() {
  return Scaffold(
    body: SafeArea(
        child: Stack(
            children: [basicPage(
              widthIcon: 40,
              heightIcon: 40,
              heightItemList: 100,
              profileImageWidth: 68,
              profileImageHeight: 68,
            ),
              Positioned(
                  top: 0,
                  left: 0,

                  child: HoverMenu(),)
            ]
        )),
  );


  }
}
