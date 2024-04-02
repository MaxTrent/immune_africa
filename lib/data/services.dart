import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:immune_africa/data/storage.dart';
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

  Future<void> deleteAccount(BuildContext context, String password) async {
    try {
      SharedPreferencesHelper.setLoggedOut();
      if (kDebugMode) {
        print('Innnnn');
      }
      await _auth.currentUser!.delete();
      await FirebaseFirestore.instance.collection("children").doc("childinfo").collection(user!.email.toString()).doc().delete().then(
            (doc) => print("Document deleted"),
        onError: (e) => print("Error updating document $e"),
      );

      var id = user!.uid;
      if (kDebugMode) {

        print('User with $id no longer exists');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "requires-recent-login") {
        await _reauthenticateAndDelete(context, password);
        } else {
        error(context, e.message);
        if (kDebugMode) {
          print(e);
        }
      }
    } catch (e) {
      error(context, e);
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> _reauthenticateAndDelete(BuildContext context, String password) async {
    try {
      var credential = EmailAuthProvider.credential(
          email: _auth.currentUser!.email!, password: password);
      _auth.currentUser!.reauthenticateWithCredential(credential);
      await _auth.currentUser?.delete();
    } catch (e) {
      error(context, e);
      if (kDebugMode) {
        print(e);
      }
    }
  }



  error(BuildContext context, errorMessage) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          width: MediaQuery.of(context).size.width,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red[600],
          elevation: 0,
          content: Text(
            errorMessage,
            textAlign: TextAlign.center,
          ),
        ),
      );

    });
  }

}