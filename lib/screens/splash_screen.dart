import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
        () => Navigator.pushNamed(context, '/onboarding'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
          color: Colors.blueAccent,
          child: Center(
            child: Container(
              height: 97,
              width: 154,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/image27.png'),
                    fit: BoxFit.contain),
              ),
            ),
          )),
    ));
  }
}
