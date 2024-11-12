import 'package:flutter/material.dart';
import 'Screen/HomeScreeen/BlocHomeScreen/Home.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryTextColor = Color(0xff0D253C);
    const secondTextColor = Color(0xff5b6580);

    return MaterialApp(
      debugShowCheckedModeBanner: false,


      theme: ThemeData(
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                  textStyle: MaterialStateProperty.all(const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily:'Avenir',
                  )))),
          textTheme: const TextTheme(
            labelMedium: TextStyle(
              fontFamily: 'Avenir',
               fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xff376AED)
            ),
              headlineSmall:
                  TextStyle(fontFamily: 'Avenir',
                      color: primaryTextColor,
                      fontSize:18
                  ),

              headlineMedium: TextStyle(
                  fontFamily: 'Avenir',
                  fontWeight: FontWeight.bold,
                  color: primaryTextColor,
                  fontSize: 20),

              titleLarge: TextStyle(
                  fontFamily: 'Avenir', color: secondTextColor, fontSize: 20),
              titleSmall: TextStyle(
                fontFamily: 'Avenir',
              ))),
      home: const Home(),
    );
  }
}
