import 'package:flutter/material.dart';
import 'package:iconnect/core/enums.dart';

import 'package:iconnect/core/network/logger.dart';
import 'package:iconnect/core/services/auth_service.dart';
import 'package:iconnect/core/viewmodels/base_viewmodel.dart';
import 'package:iconnect/locator.dart';
import 'package:iconnect/utils/validator.dart';

class SignInViewModel extends BaseModel {
  final log = getLogger('SignInViewmodel');

  final AuthService _authService = locator<AuthService>();

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
      log.i(obscurePass);
      notifyListeners();
    } else {
      _obscurePass = false;

      log.i(obscurePass);
    }
    notifyListeners();
  }

  Future<void> performLogin(BuildContext context) async {
    setViewState(ViewState.busy);
    notifyListeners();
    try {
      setViewState(ViewState.busy);
      await _authService.signIn(
          _emailController.text, _passWordController.text, context);

      setViewState(ViewState.idle);
      notifyListeners();
    } catch (e) {
      log.e('preformLogin Exception $e');
      setViewState(ViewState.idle);
      notifyListeners();
    }
  }

  void navigateToHomeView(context) {
    Navigator.pushNamed(context, '/chats');
  }
}
