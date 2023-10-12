import 'package:flutter/material.dart';

class IndividualSignUpProvider extends ChangeNotifier{
  bool _visible = false;
  bool get visible => _visible;

  Future<void> changeVisibility() async {
    _visible = !_visible;
    notifyListeners();
  }
}