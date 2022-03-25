import 'package:flutter/material.dart';
import 'package:iconnect/ui/views/auth_view.dart';
import 'package:iconnect/ui/views/chats/chat_view.dart';
import 'package:iconnect/ui/views/search_view.dart';

import 'package:iconnect/ui/views/signin_view.dart';

import 'package:iconnect/ui/views/signup/complete_signup.dart';
import 'package:iconnect/ui/views/signup/signup_view.dart';
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
      case '/search':
        return MaterialPageRoute(builder: (_) => const SearchView());
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
