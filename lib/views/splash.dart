import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/logo.svg", height: 150, width: 150),
          ],
        ),
      ),
    );
  }
}
