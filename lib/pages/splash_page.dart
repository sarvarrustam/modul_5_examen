import 'dart:async';

import 'package:flutter/material.dart';
import 'package:modul_5_examen/pages/wlecome_page.dart';

class SplashPage extends StatefulWidget {
  static const id = "/splash page";
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Size? _size;

  @override
  void didChangeDependencies() {
    _size = MediaQuery.of(context).size;

    Timer(Duration(seconds: 5), () {
      Navigator.pushNamedAndRemoveUntil(
          context, WelcomePage.id, (route) => false);
    });
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          "assets/images/logo.png",
          // height: 200,
        ),
      ),
    );
  }
}
