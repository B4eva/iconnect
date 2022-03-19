import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final String logoUri;
  const AppLogo({Key? key, required this.logoUri}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
          maxHeight: 70.0, maxWidth: 120.0, minHeight: 45.0, minWidth: 80.0),
      child: Image.asset(
        logoUri,
        fit: BoxFit.contain,
      ),
    );
  }
}
