import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInProvider extends ChangeNotifier{
  bool _visible = false;
  bool get visible =>  _visible;

  Future<void> changeVisibility() async{
    _visible = !_visible;
    notifyListeners();
  }
}