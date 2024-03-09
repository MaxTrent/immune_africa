
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:immune_africa/themes/app_themes.dart';
import 'package:firebase_storage/firebase_storage.dart';



class AddRecordProvider extends ChangeNotifier {
  bool _isExist = false;
  final _auth = FirebaseAuth.instance;
  int _selectedGender = 0;
  File? _image;
  XFile? _selectedImage;
  final _picker = ImagePicker();
  double _uploadProgress = 0.0;
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  int allowedImageSize = 5242880;
  bool _isUploading = false;
  String _downloadUrl = '';
  double get uploadProgress => _uploadProgress;
  int get selectedGender => _selectedGender;
  bool get isUploading => _isUploading;
  String get downloadUrl => _downloadUrl;



  Future<void> selectMale() async {
    _selectedGender = 1;
    notifyListeners();
  }

  Future<void> selectFemale() async {
    _selectedGender = 2;
    notifyListeners();
  }

  Future<void> addRecordToDB(BuildContext context, String firstName, String lastName, String dob,
      String gender, String relationship, String country, String imageUrl) async {
    bool childRecordExist = await doesChildRecordExist(firstName);
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
             "imageUrl": imageUrl,
        });
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
          error(context, 'Not all fields were filled');
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
        _image = File(pickedFile.path);

        uploadImage(_image!);
        print(_uploadProgress);

      }
      else{
        return;
      }



    notifyListeners();

  }

//Image Picker function to get image from camera
  Future<void> getImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera, requestFullMetadata: false);


      if (pickedFile != null) {
        _image = File(pickedFile.path);

          uploadImage(_image!);
          print(_uploadProgress);

      }
      else{
        return;
      }
    notifyListeners();
  }

  Future<int> getImageFileSize(File imageFile) async {
    final fileStat = await imageFile.stat();
    return fileStat.size;
  }

  // Future<void> uploadImage(BuildContext context) async {
  //   if (_image == null) return;
  //
  //   final fileName = _image!.path.split('/').last;
  //   final storageReference = storage.ref().child('images/$fileName');
  //
  //   final imageSize = await getImageFileSize(_image!);
  //   if (imageSize > allowedImageSize) {
  //     error(context, "File Size exceeded limit");
  //     return;
  //   } else if (imageSize > allowedImageSize * 0.9) {
  //     // Show warning message
  //   }
  //
  //   try {
  //     final uploadTask = storageReference.putFile(_image!);
  //
  //     uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
  //       _uploadProgress = snapshot.bytesTransferred / snapshot.totalBytes;
  //       notifyListeners();
  //     }, onDone: () async {
  //       final downloadUrl = await storageReference.getDownloadURL();
  //
  //       // Save download URL to Cloud Firestore (if needed)
  //       // await saveImageUrlToFirestore(downloadUrl);
  //
  //       print('Upload successful. Download URL: $downloadUrl');
  //     });
  //   } catch (e) {
  //     print('Error uploading: $e');
  //   }
  // }

  Future uploadImage(File image) async {
    Reference ref = storage.ref().child('images/${image.path.split('/').last}');
    UploadTask uploadTask = ref.putFile(File(image.path));
    _isUploading = true;

    uploadTask.snapshotEvents.listen((event) {
        _uploadProgress = event.bytesTransferred / event.totalBytes;
        notifyListeners();
        print('upload progress: $_uploadProgress');

    });
    await uploadTask.whenComplete(() async {
       _downloadUrl = await ref.getDownloadURL();
      // await firestore.collection('images').add({'url': downloadURL});
      // _isUploading = false;
      print('Image uploaded and URL stored in Firestore: $downloadUrl');
    });
    notifyListeners();
  }




  Future<void> showOptions(BuildContext context) async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child:  Text('Gallery',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(color: primaryAppColor),),
            onPressed: () {
              Navigator.of(context).pop();
              getImageFromGallery();
              notifyListeners();
            },
          ),
          CupertinoActionSheetAction(
            child: Text('Camera',
            style:Theme.of(context).textTheme.displayLarge!.copyWith(color: primaryAppColor),),
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
  void error(BuildContext context, errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red[600],
        elevation: 0,
        content: Text(
          errorMessage,
          textAlign: TextAlign.center,
        )));
  }
}
