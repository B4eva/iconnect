import 'package:bot_toast/bot_toast.dart';

import 'package:flutter/material.dart';

showToast({String? msg, bool? status, BuildContext? context}) {
  BotToast.showSimpleNotification(
      title: msg!,
      duration: const Duration(seconds: 4),
      enableSlideOff: false,
      titleStyle: TextStyle(),
      backgroundColor: status! ? Colors.green : Colors.red);
}
