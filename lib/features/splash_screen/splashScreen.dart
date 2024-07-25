// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies_app/features/page_home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'SplashScreen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    _timer;
    super.initState();
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
  var _timer;
  @override
  Widget build(BuildContext context) {
    _timer =Timer(const Duration(seconds: 2),
            () => Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>const HomeScreen())));
    return  ClipRRect(
        child: Image.asset('assets/images/splash.png',fit: BoxFit.fill,));
  }
}
