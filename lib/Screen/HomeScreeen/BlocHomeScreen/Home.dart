import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../BasicPage.dart';
import 'BlocHome.dart';
import 'EventsHome.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    return const Scaffold(
      body: SafeArea(
          child: basicPage(
        widthIcon: 30,
        heightIcon: 30,
        heightItemList: 90,
        profileImageWidth: 64,
        profileImageHeight: 64,

      )),
    );
  }

  Widget _buildTabletLayout() {
    return const Scaffold(
      body: SafeArea(
          child: basicPage(
        widthIcon: 40,
        heightIcon: 40,
        heightItemList: 100,
        profileImageWidth: 68,
        profileImageHeight: 68,

      )),
    );
  }

  Widget _buildDesktopLayout() {
    return const Scaffold(
      body: SafeArea(
          child: basicPage(
        widthIcon: 50,
        heightIcon: 50,
        heightItemList: 110,
        profileImageWidth: 72,
        profileImageHeight: 72,

      )),
    );
  }
}
