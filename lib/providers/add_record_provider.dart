import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddRecordProvider extends ChangeNotifier {
  bool _isExist = false;
  final _auth = FirebaseAuth.instance;
  int _selectedGender = 0;

  int get selectedGender => _selectedGender;

  Future<void> selectMale() async {
    _selectedGender = 1;
    notifyListeners();
  }

  Future<void> selectFemale() async {
    _selectedGender = 2;
    notifyListeners();
  }

  Future<void> addRecordToDB(String firstName, String lastName, DateTime dob,
      String gender, String relationship, String country) async {
    bool childRecordExist = await doesChildRecordExist(firstName);
    final user = _auth.currentUser;
    if (user!.uid.isNotEmpty) {
      try {
        CollectionReference children =
            FirebaseFirestore.instance.collection('children');
        await children.add({
          "firstname": firstName,
          "laastname": lastName,
          "dob": dob,
          "gender": gender,
          "relationship": relationship,
          "country": country,
        });
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }
    }
  }

  Future<bool> doesChildRecordExist(String name) async {
    final user = _auth.currentUser;

    await FirebaseFirestore.instance
        .collection("expenses")
        .doc("budgets")
        .collection(user!.email.toString())
        .where('lowerCaseBudgetName', isEqualTo: name.toLowerCase())
        .limit(1)
        .get()
        .then((docs) {
      if (docs.size >= 1) {
        _isExist = true;
      } else {
        _isExist = false;
      }
    }, onError: (e) {
      print("Error completing: $e");
      // _dialogBuilder(context, 'FAILURE', e.toString());
    });

    return _isExist;
  }
}
