import 'package:flutter/material.dart';
import 'package:iconnect/ui/views/auth_view.dart';
import 'package:iconnect/ui/views/chats/chat_view.dart';
import 'package:iconnect/ui/views/chats/signup/complete_signup.dart';
import 'package:iconnect/ui/views/signin_view.dart';
import 'package:iconnect/ui/views/chats/signup/signup_view.dart';
import 'package:iconnect/ui/views/welcome_view.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settins) {
    switch (settins.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const WelcomeView());
      case '/auth':
        return MaterialPageRoute(builder: (_) => const AuthView());
      case '/signup':
        return MaterialPageRoute(builder: (_) => const SignUpView());
      case '/signin':
        return MaterialPageRoute(builder: (_) => const SignInView());
      case '/signup/complete':
        return MaterialPageRoute(builder: (_) => const CompleteSignUp());
      case '/chats':
        return MaterialPageRoute(builder: (_) => const ChatView());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('404: page not found'),
            ),
          );
        });
    }
  }
}
