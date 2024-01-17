import 'package:cloud_firestore/cloud_firestore.dart';

class Records {
  final String firstName;
  final String lastName;
  final String dob;

  Records({required this.firstName,
    required this.lastName,
    required this.dob,});

  Map<String, dynamic> toMap() {
    return {
      "firstname": firstName,
      "lastname": lastName,
      "dob": dob,
    };
  }

  Records.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : firstName = doc.data()!["firstname"],
        lastName = doc.data()!["lastname"],
        dob = doc.data()!["dob"];


}
