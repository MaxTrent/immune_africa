

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:immune_africa/themes/app_themes.dart';

class AddRecordProvider extends ChangeNotifier {
  bool _isExist = false;
  final _auth = FirebaseAuth.instance;
  int _selectedGender = 0;
  XFile? _image;
  final _picker = ImagePicker();

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
    notifyListeners();
    if (user!.uid.isNotEmpty) {
      try {
           await FirebaseFirestore.instance.collection("children").doc("childinfo").collection(user.email.toString()).add({
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
    notifyListeners();
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
        notifyListeners();
      } else {
        _isExist = false;
        notifyListeners();
      }
    }, onError: (e) {
      if (kDebugMode) {
        print("Error completing: $e");
      }
      // _dialogBuilder(context, 'FAILURE', e.toString());
    });

    return _isExist;
  }




//Image Picker function to get image from gallery
  Future<void> getImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery, requestFullMetadata: false);
      if (pickedFile != null) {
        _image = XFile(pickedFile.path);
        notifyListeners();
      }
    notifyListeners();

  }

//Image Picker function to get image from camera
  Future<void> getImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera, requestFullMetadata: false);


      if (pickedFile != null) {
        _image = XFile(pickedFile.path);
        notifyListeners();
      }
    notifyListeners();
  }

  Future<void> showOptions(BuildContext context) async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child:  Text('Gallery',
            style: Theme.of(context).textTheme.headline2!.copyWith(color: primaryAppColor),),
            onPressed: () {
              Navigator.of(context).pop();
              getImageFromGallery();
              notifyListeners();
            },
          ),
          CupertinoActionSheetAction(
            child: Text('Camera',
            style:Theme.of(context).textTheme.headline2!.copyWith(color: primaryAppColor),),
            onPressed: () {
              Navigator.of(context).pop();
              getImageFromCamera();
              notifyListeners();
            },
          ),
        ],
      ),
    );
  }
}
