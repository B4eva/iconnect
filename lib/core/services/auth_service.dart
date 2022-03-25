import 'dart:io';

import 'package:flutter/material.dart';

import 'package:iconnect/core/network/logger.dart';
import 'package:iconnect/core/network/toast.dart';
import 'package:iconnect/core/services/database.dart';
import 'package:iconnect/core/services/firebase_auth_service.dart';
import 'package:iconnect/locator.dart';
import 'package:iconnect/ui/views/auth_view.dart';
import 'package:iconnect/ui/views/chats/chat_view.dart';

import 'package:iconnect/ui/views/signup/complete_signup.dart';
import 'package:iconnect/utils/boxes.dart';

class AuthService {
  final logger = getLogger('Authservice');
  final FireBaseAuthService _fireBaseAuthService =
      locator<FireBaseAuthService>();

  final DatabaseService _databaseMethods = locator<DatabaseService>();

  Future<dynamic> signIn(
      String email, String password, BuildContext context) async {
    var response = await _fireBaseAuthService.auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      logger.i('Sign in value here: ${value.user}');
      if (value != null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const ChatView()));
        showToast(msg: 'Welcome', status: true);
      }
    }).catchError((e) {
      if (e == IOException) {
        showToast(msg: 'Please try later', status: false);
      }
      showToast(msg: '${e!.message}', status: false);

      logger.e('signIn Exception $e');
    });
    logger.i('SignIn response $response');
    getToken();
  }

  Future getToken() async {
    try {
      final tokenResult = _fireBaseAuthService.auth.currentUser!;
      final idToken = await tokenResult.getIdToken();
      final token = idToken;

      var box = Boxes().getTokenBox;

      //stores the token
      box.put('tokenId', token);

      logger.i('response token $token');
    } catch (e) {
      logger.e('An Exception  on getToken $e');
    }
  }

  Future<dynamic> signUp(
      String username,
      String email,
      String password,
      String firstname,
      String lastname,
      String address,
      BuildContext context) async {
    var response = await _fireBaseAuthService.auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then(
      (value) {
        if (value != null) {
          Map<String, String> userInfoMap = {'name': username, 'email': email};

          _databaseMethods.uploadUserInfo(userInfoMap);

          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const CompleteSignUp()));
        }
      },
    ).catchError((e) {
      showToast(msg: 'Failed, try later', status: false);
      logger.e('sign up Exception $e');
    });
    logger.i(response);
  }

  Future signOut(context) async {
    await _fireBaseAuthService.auth.signOut().then((value) =>
        Navigator.of(context)
            .pop(MaterialPageRoute(builder: (context) => const AuthView())));
  }
}
