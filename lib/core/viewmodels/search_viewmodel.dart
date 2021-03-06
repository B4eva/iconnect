import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconnect/core/enums.dart';
import 'package:iconnect/core/network/logger.dart';
import 'package:iconnect/core/services/database.dart';
import 'package:iconnect/core/viewmodels/base_viewmodel.dart';
import 'package:iconnect/locator.dart';
import 'package:iconnect/ui/views/conversation/conversation_view.dart';

class SearchViewModel extends BaseModel {
  final log = getLogger('serachviewModel');
  final _databaseService = locator<DatabaseService>();

  QuerySnapshot? _searchSnapshot;
  QuerySnapshot? get searchSnapshot => _searchSnapshot;

  final TextEditingController _serachTextEditingController =
      TextEditingController();

  TextEditingController get serachTextEditingController =>
      _serachTextEditingController;

  Future searchUserByName(String? username) {
    return _databaseService.getUserByUsername(username!);
  }

  initiateSearach() {
    setViewState(ViewState.busy);
    searchUserByName(serachTextEditingController.text).then((value) {
      _searchSnapshot = value;

      notifyListeners();
      setViewState(ViewState.idle);

      log.i('search results: ${value} ');
    });
  }

  createChatRoomAndStartConversation(context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ConversationView()));
  }

  // List<String> _users = [username, myName];
  // List<String> get users => _users;
}
