import 'package:flutter/cupertino.dart';

class AuthServices with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoadin => _isLoading;
  String _errorMessages;
  String get errorMessages => _errorMessages;

  Future Login(String email, String password) {}
  void setLoadin(val) {
    _isLoading = val;
    notifyListeners();
  }
}
