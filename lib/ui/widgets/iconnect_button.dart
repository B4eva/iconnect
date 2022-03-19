import 'package:flutter/material.dart';
import 'package:iconnect/ui/shared/app_colors.dart';
import 'package:iconnect/ui/shared/media_query.dart';

class IconnectButton extends StatelessWidget {
  ///
  /// [IconnectButton] custom button
  ///

  const IconnectButton(
      {Key? key,
      this.color,
      required this.child,
      required this.onClicked,
      this.radius,
      required this.fixedSize,
      this.filled = false})
      : super(key: key);

  final Color? color;
  final Widget child;
  final VoidCallback onClicked;
  final double? radius;
  final Size fixedSize;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClicked,
      child: child,
      style: ElevatedButton.styleFrom(
          primary: filled ? color : Colors.transparent,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 20),
              side: BorderSide(
                  color: filled ? Colors.transparent : kPrimaryColor))),
    );
  }
}

class AppButton extends StatelessWidget {
  final Color? color;
  final Widget child;
  final VoidCallback onClicked;
  final double? radius;
  // final Size fixedSize;
  final bool filled;
  const AppButton(
      {Key? key,
      this.color,
      required this.child,
      required this.onClicked,
      this.radius,
      // required this.fixedSize,
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
              textStyle: TextStyle(color: Colors.white, fontSize: 14),
              backgroundColor: color),
          onPressed: onClicked,
          child: child),
    );
  }
}
