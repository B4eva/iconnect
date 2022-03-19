import 'package:flutter/material.dart';
import 'package:iconnect/ui/views/auth_view.dart';
import 'package:iconnect/ui/views/chat_view.dart';
import 'package:iconnect/ui/views/welcome_view.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settins) {
    switch (settins.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const WelcomeView());
      case '/auth':
        return MaterialPageRoute(builder: (_) => const AuthView());
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
