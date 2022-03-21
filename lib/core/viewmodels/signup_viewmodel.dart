import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconnect/core/viewmodels/base_viewmodel.dart';
import 'package:iconnect/ui/views/chats/signup/signup_view.dart';

import '../../ui/views/chats/components/body.dart';
import '../../utils/validator.dart';
import '../network/logger.dart';

class SignUpViewModel extends BaseModel {
  final loggger = getLogger('authViewModel');

// input field controllers
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();

  TextEditingController _userNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _passWordController = TextEditingController();
  TextEditingController _confirmPassWordController = TextEditingController();

  // getters
  TextEditingController get phoneNumberController => _phoneNumberController;
  TextEditingController get userNameController => _userNameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get firstNameController => _firstNameController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get addressController => _addressController;
  TextEditingController get passWordController => _passWordController;
  TextEditingController get confirmPassWordController =>
      _confirmPassWordController;

  final Validator _validator = Validator();
  Validator get validator => _validator;

  bool _obscurePass = false;
  bool get obscurePass => _obscurePass;

  bool _checkVal = false;
  bool get checkVal => _checkVal;

  void setCheckVal(bool val) {
    _checkVal = val;
    notifyListeners();
  }

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

  void navigateToCompleteSignup(context) {
    Navigator.pushNamed(context, '/signup/complete');
  }

  void navigateToSignin(context) {
    Navigator.pushNamed(context, '/signin');
  }

  void navigateback(context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => SignUpView()));
  }
}
