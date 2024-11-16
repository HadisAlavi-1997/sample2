
import 'package:flutter/material.dart';

import '../Screen/HomeScreeen/BlocHomeScreen/Home.dart';
import '../gen/assets.gen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => const Home()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width =MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Assets.logo.splash.image(fit: BoxFit.cover)),
          Center(
            //child: Assets.logo.logo.image(width:width>1021? 300:100),
          )
        ],
      ),
    );
  }
}
