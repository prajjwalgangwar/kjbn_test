import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kjbn_test_dummy/screens/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false);
    });
    super.initState();
  }

  @override
  void dispose() {
    debugPrint('cancelling timer');
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset('assets/logo.gif')],
        ),
      ),
    );
  }
}
