import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:iconnect/core/network/logger.dart';
import 'package:iconnect/core/viewmodels/base_viewmodel.dart';
import 'package:iconnect/ui/shared/contant_text.dart';
import 'package:logger/logger.dart';

import '../../utils/boxes.dart';

class WelcomeViewModel extends BaseModel {
  Logger logger = getLogger('WelcomeViewModel');

  List<String> get welcomeScreenAnimationMessages => welcomeScreenAnimationText;

  int _currentPage = 0;
  int get currentPage => _currentPage;

  String? _token;
  String? get token => _token;

  setToken(String value) {
    _token = value;
    notifyListeners();
  }

  void awaitBox() async {
    var box = Boxes().getTokenBox.toString();

    setToken(box);
    notifyListeners();
  }

  startTime() async {
    var _duration = const Duration(seconds: 3);
    return Timer(_duration, () {
      skipAuthentication;
      notifyListeners();
    });
  }

  void navigateFromToken() {
    checkLogin();
  }

  void checkLogin() {
    var token = Boxes().getTokenBox;
    _token = token.toString();
    if (token.length != 0) {
      startTime();
    }
  }

  void skipAuthentication(context) {
    Navigator.pushNamed(context, '/chats');
    notifyListeners();
  }

  void setCurrentPage(value) {
    _currentPage = value;
    notifyListeners();
  }

  void navigateToAuthView(context) {
    Navigator.pushNamed(context, '/auth');
    notifyListeners();
  }
}
