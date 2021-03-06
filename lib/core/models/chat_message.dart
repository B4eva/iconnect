import 'package:flutter/material.dart';

import '../enums.dart';

class ChatMessage {
  final String? text;
  final ChatMessageType? messageType;
  final MessageStatus? messageStatus;
  final bool? isSender;

  ChatMessage({
    this.text,
    @required this.messageType,
    @required this.messageStatus,
    @required this.isSender,
  });
}
