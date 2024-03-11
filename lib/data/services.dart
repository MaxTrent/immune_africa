import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:immune_africa/models/models.dart';


final databaseServiceProvider = Provider((ref)=> DatabaseService());

class DatabaseService{
  final _db = FirebaseFirestore.instance;
  User? user;
  final _auth = FirebaseAuth.instance;


  List<Records>? _retrievedRecordsList;

  Future<void> retrieveRecords() async {
    user = _auth.currentUser;
    try{
      QuerySnapshot<Map<String, dynamic>> snapshot = await _db
          .collection("children")
          .doc("childinfo")
          .collection(user!.email.toString())
          .get();

      _retrievedRecordsList = snapshot.docs.map((docSnapshot) => Records.fromDocumentSnapshot(docSnapshot)).toList();

      if (kDebugMode) {
        print(_retrievedRecordsList!.length);
      }
    }
    catch(e){
      if (kDebugMode) {
        print('Error retrieving record: $e');
      }
    } finally {
      // _loading = false;
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


  // Future<List<Records>> retrieveRecords() async {
  //   QuerySnapshot<Map<String, dynamic>> snapshot = await _db
  //       .collection("children")
  //       .doc("childinfo")
  //       .collection(user!.email.toString())
  //       .get();
  //
  //   return snapshot.docs.map((docSnapshot) => Records.fromDocumentSnapshot(docSnapshot)).toList();
  // }

}