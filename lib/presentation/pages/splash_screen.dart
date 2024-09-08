import 'package:flutter/material.dart';
import 'package:prod_keeper/core/theme/color_pallette.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallette.primaryColor,
      body: Stack(
        children: [
          Image.asset(
            "assets/images/pattern_big.png",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset("assets/images/logo.png"),
          )
        ],
      ),
    );
  }
}
