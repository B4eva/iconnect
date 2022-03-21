class Validator {
  String? validateEmail(String? value) {
    String pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = RegExp(pattern);
    if (value!.isEmpty) {
      return 'Field cannot be empty.';
    } else if (!regex.hasMatch(value)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  String? validatePassWord(String? value) {
    String pattern = r'^(?=.*?[0-9]).{8,30}$';
    RegExp regex = RegExp(pattern);
    if (value!.isEmpty) {
      return 'Field cannot be empty';
    } else if (!regex.hasMatch(value)) {
      return 'Your password must be at least 8-30 \ncharacters long with a number.';
    }
    return null;
  }

  String? confirmPassWordValidation(String? value) {
    if (value!.isEmpty) {
      return 'password cannot be empty';
    } else if (validatePassWord(value) != value) {
      return 'Password does not match';
    }

    return null;
  }

  String? validateName(String? value) {
    if (value!.isEmpty) {
      return 'Please enter a name.';
    } else {
      return null;
    }
  }

  String? validateNumber(String? value) {
    String pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'Please enter a number.';
    } else {
      return null;
    }
  }

  // for any other validation required
  String validateOthers(String value) {
    if (value.isEmpty) {
      return 'Field must not be empty.';
    } else {
      return value;
    }
  }
}
