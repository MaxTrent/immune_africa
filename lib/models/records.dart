import 'package:cloud_firestore/cloud_firestore.dart';

class Records {
  final String firstName;
  final String lastName;
  final DateTime dob;

  Records({required this.firstName,
    required this.lastName,
    required this.dob,});

  Map<String, dynamic> toMap() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "dob": dob,
    };
  }

  Records.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : firstName = doc.data()!["firstName"],
        lastName = doc.data()!["lastName"],
        dob = doc.data()!["dob"].toDate();


  void compareTo(Records records) {}
}
