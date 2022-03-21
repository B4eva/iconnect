import 'package:flutter/material.dart';
import 'package:iconnect/core/network/logger.dart';
import 'package:iconnect/core/viewmodels/base_viewmodel.dart';
import 'package:iconnect/utils/validator.dart';

class SignInViewModel extends BaseModel {
  final logger = getLogger('SignInViewmodel');

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();

  TextEditingController get passWordController => _passWordController;

  TextEditingController get emailController => _emailController;

  final Validator _validator = Validator();
  Validator get validator => _validator;

  bool _obscurePass = false;
  bool get obscurePass => _obscurePass;

  void obscure() {
    if (_obscurePass == false) {
      _obscurePass = true;
      logger.i(obscurePass);
      notifyListeners();
    } else {
      _obscurePass = false;

      logger.i(obscurePass);
    }
    notifyListeners();
  }

  void navigateToHomeView(context) {
    Navigator.pushNamed(context, '/chats');
  }
}
