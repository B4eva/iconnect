import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final loadWidget = Center(
  child: SizedBox.fromSize(
    size: const Size.square(30),
    child: (Platform.isIOS || Platform.isMacOS)
        ? const CupertinoActivityIndicator()
        : const CircularProgressIndicator(),
  ),
);
