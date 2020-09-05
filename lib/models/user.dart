import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  String name;
  String email;
  String password;
  String confirmPassword;

  User({this.id, this.name, this.email, this.password, this.confirmPassword});

  User.fromDocument(DocumentSnapshot document) {
    id = document.documentID;
    name = document.data['name'] as String;
    email = document.data['email'] as String;
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }

  Future<void> saveData() async {
    await firestoreRef.setData(toMap());
  }

  DocumentReference get firestoreRef =>
      Firestore.instance.document('users/$id');
}
