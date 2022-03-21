import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  ///
  /// [AppButton] custom button
  ///

  final Color? color;
  final Widget child;
  final VoidCallback onClicked;
  final double? radius;

  final bool filled;
  const AppButton(
      {Key? key,
      this.color,
      required this.child,
      required this.onClicked,
      this.radius,
      this.filled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 11,
      width: double.infinity,
      child: TextButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              textStyle: const TextStyle(color: Colors.white, fontSize: 14),
              backgroundColor: color),
          onPressed: onClicked,
          child: child),
    );
  }
}
