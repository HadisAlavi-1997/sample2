import 'package:flutter/material.dart';
import 'Screen/Article/Article.dart';
import 'Screen/HomeScreeen/BlocHomeScreen/Home.dart';
import 'Screen/ProfileScreen/Profile.dart';
import 'Splash/SplashScreen.dart';
import 'gen/fonts.gen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryTextColor = Color(0xff0D253C);
    const secondTextColor = Color(0xff5b6580);
    const primaryColor = Color(0xff376AED);

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Avenir',
          )))),
          textTheme: const TextTheme(
            labelMedium: TextStyle(
                fontFamily: 'Avenir',
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xff376AED)),
            headlineSmall: TextStyle(
                fontFamily: 'Avenir', color: primaryTextColor, fontSize: 18),
            headlineMedium: TextStyle(
                fontFamily: 'Avenir',
                fontWeight: FontWeight.bold,
                color: primaryTextColor,
                fontSize: 20),
            titleLarge: TextStyle(
                fontFamily: 'Avenir', color: primaryTextColor, fontSize: 20,fontWeight:FontWeight.w700),
            titleSmall: TextStyle(
              fontFamily: 'Avenir',
            ),
            bodySmall: TextStyle(
                fontFamily: FontFamily.avenir,
                fontWeight: FontWeight.w500,
                color: Color(0xff7B8BB2),
                fontSize: 8),
          ),
        colorScheme: const ColorScheme.light(
          background: Color(0xffFBFCFF),
            surface: Colors.white,
            primary:  primaryColor,
            onBackground: primaryTextColor),
        appBarTheme: const AppBarTheme(
          titleSpacing: 32,// Distance from the left page
          color:Colors.white,
          foregroundColor:primaryTextColor,

        ),
        useMaterial3: true,
      ),


      home: const Home(),

    );
  }
}
