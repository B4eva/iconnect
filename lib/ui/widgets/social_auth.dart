import 'package:flutter/material.dart';
import 'package:iconnect/ui/shared/app_colors.dart';

class SocialAuth extends StatelessWidget {
  const SocialAuth(
      {Key? key,
      this.height = 37,
      this.width = 37,
      required this.onTap,
      required this.iconUrl})
      : super(key: key);
  final double height;
  final double width;
  final VoidCallback onTap;
  final String iconUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(12.0),
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: MediaQuery.of(context).platformBrightness == Brightness.light
                ? KContentColorPurple
                : Colors.white),
        child: Image.asset(
          iconUrl,
          height: 38.0,
          width: 38.0,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
