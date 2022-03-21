import 'package:flutter/cupertino.dart';
import 'package:iconnect/core/network/logger.dart';
import 'package:iconnect/core/viewmodels/base_viewmodel.dart';
import 'package:iconnect/ui/shared/contant_text.dart';
import 'package:logger/logger.dart';

class WelcomeViewModel extends BaseModel {
  Logger logger = getLogger('WelcomeViewModel');

  List<String> get welcomeScreenAnimationMessages => welcomeScreenAnimationText;

  int _currentPage = 0;
  int get currentPage => _currentPage;

  void setCurrentPage(value) {
    _currentPage = value;
    notifyListeners();
  }

  void navigateToAuthView(context) {
    Navigator.pushNamed(context, '/auth');
  }
}
