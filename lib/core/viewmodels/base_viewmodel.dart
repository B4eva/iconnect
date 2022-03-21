import 'package:flutter/cupertino.dart';
import 'package:iconnect/core/enums.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.idle;
  ViewState get state => _state;

  void setViewState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
