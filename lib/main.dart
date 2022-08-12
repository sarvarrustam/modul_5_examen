import 'package:flutter/material.dart';
import 'package:modul_5_examen/pages/home_page.dart';
import 'package:modul_5_examen/pages/splash_page.dart';
import 'package:modul_5_examen/pages/wlecome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        SplashPage.id: (context) => const SplashPage(),
        WelcomePage.id: (context) => const WelcomePage(),
        HomePage.id: (context) => const HomePage(),
      },
      home: const SplashPage(),
    );
  }
}
