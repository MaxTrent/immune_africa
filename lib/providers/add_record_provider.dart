

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddRecordProvider extends ChangeNotifier {
  bool _isExist = false;
  final _auth = FirebaseAuth.instance;
  int _selectedGender = 0;
  XFile? _image;
  final picker = ImagePicker();

  int get selectedGender => _selectedGender;

  Future<void> selectMale() async {
    _selectedGender = 1;
    notifyListeners();
  }

  Future<void> selectFemale() async {
    _selectedGender = 2;
    notifyListeners();
  }

  Future<void> addRecordToDB(String firstName, String lastName, String dob,
      String gender, String relationship, String country) async {
    // bool childRecordExist = await doesChildRecordExist(firstName);
    final user = _auth.currentUser;
    if (user!.uid.isNotEmpty) {
      try {
        CollectionReference children =
            FirebaseFirestore.instance.collection('children');
        await children.add({
          "firstname": firstName,
          "lastname": lastName,
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
        .collection("children")
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




//Image Picker function to get image from gallery
  Future<void> getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        _image = XFile(pickedFile.path);
        notifyListeners();
      }
    notifyListeners();

  }

//Image Picker function to get image from camera
  Future<void> getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);


      if (pickedFile != null) {
        _image = XFile(pickedFile.path);
      }
  }

  Future<void> showOptions(BuildContext context) async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: Text('Gallery'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from gallery
              getImageFromGallery();
            },
          ),
          CupertinoActionSheetAction(
            child: Text('Camera'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from camera
              getImageFromCamera();
            },
          ),
        ],
      ),
    );
  }
}
