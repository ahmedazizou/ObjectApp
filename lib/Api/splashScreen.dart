import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

import 'homeScreen.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 1,
      navigateAfterSeconds: HomeScreen(),
      photoSize: 150,
    );
  }
}
