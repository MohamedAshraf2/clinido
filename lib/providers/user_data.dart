import 'package:flutter/material.dart';
import 'package:clinido/models/fire_user.dart';

class UserData extends ChangeNotifier {
  List<FireUser> fireUsers = [];
  FireUser _fireUser;

  FireUser get fireUser {
    return _fireUser;
  }

  void intiFireUser(Map<dynamic, dynamic> json) {
    FireUser tfu = FireUser.fromJson(json);
    _fireUser = tfu;
    notifyListeners();
  }

  set fireUser(FireUser fromJson) {
    _fireUser = fromJson;
    notifyListeners();
  }
}
