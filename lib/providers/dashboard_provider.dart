import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:immune_africa/data/services.dart';
import 'package:immune_africa/models/models.dart';

class DashBoardProvider extends ChangeNotifier {
  DatabaseService service = DatabaseService();
  bool _loading = false;
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  String? _error;
  User? user;
  Future<List<Records>>? _recordsList;
  List<Records>? _retrievedRecordsList;
  bool get loading => _loading;
  Future<List<Records>>? get recordsList => _recordsList;
  List<Records>? get retrievedRecordsList => _retrievedRecordsList;



  Future<void> retrieveRecords() async {
    user = _auth.currentUser;
    try{
      _loading = true;
      // notifyListeners();

      QuerySnapshot<Map<String, dynamic>> snapshot = await _db
          .collection("children")
          .doc("childinfo")
          .collection(user!.email.toString())
          .get();

      _retrievedRecordsList = snapshot.docs.map((docSnapshot) => Records.fromDocumentSnapshot(docSnapshot)).toList();
      notifyListeners();
      if (kDebugMode) {
        print(_retrievedRecordsList!.length);
      }
    }
    catch(e){
      _error = 'An error occurred';
      if (kDebugMode) {
        print('Error retrieving record: $e');
      }
    } finally {
      _loading = false;
      print('nothing happened');
      // notifyListeners();
    }

    // _recordsList = service.retrieveRecords();
    // _retrievedRecordsList = await service.retrieveRecords();
    // notifyListeners();
    // QuerySnapshot<Map<String, dynamic>> snapshot = await _db
    //     .collection("collectionPath")
    //     .doc("childinfo")
    //     .collection(user!.email.toString())
    //     .get();
    //
    // return snapshot.docs.map((docSnapshot) => Records.fromDocumentSnapshot(docSnapshot)).toList();
  }



  Future<void> getAllData() async {
    _loading = true;
    notifyListeners();

    // getDefaultValues();
    // _initRetrieval();
  }
}
