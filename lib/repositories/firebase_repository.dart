import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:storagenotification/helpers/firebase_errors.dart';
import 'package:storagenotification/models/user.dart';

class FirebaseRepository {
  final FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseUser user;

  Future<void> signIn(User user, Function onFail, Function onSuccess) async {
    try {
      final AuthResult result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      this.user = result.user;
      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
  }

  Future<void> loadCurrentUser() async {
    final FirebaseUser currentUser = await auth.currentUser();
    if (currentUser != null) {
      user = currentUser;
    }
  }
}
