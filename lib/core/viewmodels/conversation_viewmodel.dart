import 'package:iconnect/core/enums.dart';
import 'package:iconnect/core/models/chat_message.dart';
import 'package:iconnect/core/viewmodels/base_viewmodel.dart';

class ConversationViewModel extends BaseModel {
  List<ChatMessage> _demoChatMessages = [
    ChatMessage(
      text: "Hi Sajol,",
      messageType: ChatMessageType.text,
      messageStatus: MessageStatus.viewed,
      isSender: false,
    ),
    ChatMessage(
      text: "Hello, How are you?",
      messageType: ChatMessageType.text,
      messageStatus: MessageStatus.viewed,
      isSender: true,
    ),
    ChatMessage(
      text: "",
      messageType: ChatMessageType.audio,
      messageStatus: MessageStatus.viewed,
      isSender: false,
    ),
    ChatMessage(
      text: "",
      messageType: ChatMessageType.video,
      messageStatus: MessageStatus.viewed,
      isSender: true,
    ),
    ChatMessage(
      text: "Error happend",
      messageType: ChatMessageType.text,
      messageStatus: MessageStatus.not_sent,
      isSender: true,
    ),
    ChatMessage(
      text: "This looks great man!!",
      messageType: ChatMessageType.text,
      messageStatus: MessageStatus.viewed,
      isSender: false,
    ),
    ChatMessage(
      text: "Glad you like it",
      messageType: ChatMessageType.text,
      messageStatus: MessageStatus.not_view,
      isSender: true,
    ),
  ];

  List<ChatMessage> get demoChatMessages => _demoChatMessages;
}
