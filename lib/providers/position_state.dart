import 'package:flutter/material.dart';

class NavPositionState extends ChangeNotifier {
  Position? _position;

  set position(Position? position) {
    _position = position;
    notifyListeners();
  }

  Position? get position => _position;
}

enum Position {
  SETTINGS,

  USER_HOME,
  USER_BETRAS,
  USER_ANORDNUNGEN,
  USER_WAGENKARTEN,
  USER_SCHWARZES_BRETT,
  USER_RUNDSCHREIBEN,
  USER_DIENSTANWEISUNG,

  ADMIN_HOME,
  ADMIN_CREATE_DOCUMENT,
  ADMIN_MANAGE_DOCUMENTS,
  ADMIN_CREATE_COLLECTION,
  ADMIN_MANAGE_COLLECTIONS,
  ADMIN_CHANGE_USER_PASSWORD,
  ADMIN_CHANGE_ADMIN_PASSWORD,

  NONE
}
