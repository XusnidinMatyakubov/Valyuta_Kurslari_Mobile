import 'dart:async';

import 'package:flutter/material.dart';
import 'package:valyutalar/screen/ValyutaKurslariGridFull.dart';

import 'AppOpenAdManager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AppOpenAdManager appOpenAdManager = AppOpenAdManager();

  @override
  void initState() {
    super.initState();

    appOpenAdManager.loadAd();

    Future.delayed(const Duration(milliseconds: 800)).then((value) {
      appOpenAdManager.showAdIfAvailable();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const KursValyutaFull(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
        // child: SplashScreen(),
      ),
    );
  }
}