import 'package:flutter/material.dart';

class AddRecordProvider extends ChangeNotifier{
  int _selectedGender = 0;
  int get selectedGender => _selectedGender;

  Future<void> selectMale() async{
    _selectedGender = 1;
    notifyListeners();
  }

  Future<void> selectFemale() async{
    _selectedGender = 2;
    notifyListeners();
  }

  Future<void> sendRecordToDB() async{

  }
}