import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:immune_africa/models/models.dart';

class DatabaseService{
  final _db = FirebaseFirestore.instance;
  User? user;

  Future<List<Records>> retrieveRecords() async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await _db
        .collection("children")
        .doc("childinfo")
        .collection(user!.email.toString())
        .get();

    return snapshot.docs.map((docSnapshot) => Records.fromDocumentSnapshot(docSnapshot)).toList();
  }

}