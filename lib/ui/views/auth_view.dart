import 'package:flutter/material.dart';
import 'package:iconnect/ui/fragments/splash_background.dart';
import 'package:iconnect/ui/fragments/splash_fragment.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const <Widget>[/*SplashBackground(),*/ SplashFragment()],
      ),
    );
  }
}
