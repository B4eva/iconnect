import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconnect/core/models/chat_model.dart';
import 'package:iconnect/core/network/logger.dart';
import 'package:iconnect/core/viewmodels/base_viewmodel.dart';
import 'package:iconnect/locator.dart';
import 'package:iconnect/utils/shared_preferences/shared_preference.dart';

import 'package:logger/logger.dart';

import '../../ui/views/conversation/conversation_view.dart';
import '../services/auth_service.dart';

class ChatViewModel extends BaseModel {
  Logger logger = getLogger('ChatViewmodel');

  final AuthService _authService = locator<AuthService>();

  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  List<String> users = [];

  getUserInfo() async {
    var myName = await SharedPreferencesHelper.getUserEmailFromPreference();
    logger.i('my name $myName');
  }

  final List _chatsData = <Chat>[
    Chat(
      name: "Jenny Glenn",
      lastMessage: "Hope you are doing well...",
      image: "assets/images/user.png",
      time: "3m ago",
      isActive: false,
    ),
    Chat(
      name: "Ndam Lesly",
      lastMessage: "Hello Abdullah! I am...",
      image: "assets/images/user_2.png",
      time: "8m ago",
      isActive: true,
    ),
    Chat(
      name: "Bright Efuet",
      lastMessage: "Do you have update...",
      image: "assets/images/user_3.png",
      time: "5d ago",
      isActive: false,
    ),
    Chat(
      name: "Njiki samsam",
      lastMessage: "You’re welcome :)",
      image: "assets/images/user_4.png",
      time: "5d ago",
      isActive: true,
    ),
    Chat(
      name: "Albert Boom",
      lastMessage: "Thanks",
      image: "assets/images/user_5.png",
      time: "6d ago",
      isActive: false,
    ),
    Chat(
      name: "Iclan client",
      lastMessage: "Hope you are doing well...",
      image: "assets/images/user.png",
      time: "3m ago",
      isActive: false,
    ),
    Chat(
      name: "Ester Bright",
      lastMessage: "Hello fanny sup...",
      image: "assets/images/user_2.png",
      time: "8m ago",
      isActive: true,
    ),
    Chat(
      name: "Tanze Thomas",
      lastMessage: "Do you have geography text book...",
      image: "assets/images/user_3.png",
      time: "5d ago",
      isActive: false,
    ),
  ];

  List get chatData => _chatsData;

  void navigateToSearch(context) {
    Navigator.pushNamed(context, '/search');
  }

  createChatRoomAndStartConversation(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ConversationView()));
  }

  signOut(context) async {
    await _authService.signOut(context);
  }
}
