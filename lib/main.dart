import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:iconnect/locator.dart';
import 'package:iconnect/theme/theme.dart';
import 'package:iconnect/ui/router.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IConnect',
      builder: BotToastInit(),
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      navigatorObservers: [BotToastNavigatorObserver()],
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: '/',
    );
  }
}
