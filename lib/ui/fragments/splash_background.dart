import 'package:flutter/material.dart';
import 'package:iconnect/ui/shared/app_colors.dart';
import 'package:iconnect/ui/shared/media_query.dart';

class SplashBackground extends StatelessWidget {
  const SplashBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: fullHeight(context),
      width: fullWidth(context),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            // where the linear gradient begins and ends
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,

            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 0.7, 1.0],
            colors: splashGradientList),
      ),
    );
  }
}
