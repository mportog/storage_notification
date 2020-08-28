import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:storagenotification/helpers/firebase_errors.dart';
import 'package:storagenotification/models/user.dart';
import 'package:mobx/mobx.dart';
part 'firebase_store.g.dart';

class FirebaseStore = _FirebaseStoreBase with _$FirebaseStore;

abstract class _FirebaseStoreBase with Store {
  @observable
  bool isLoading = false;

  set loading(bool value) => isLoading = value;
  bool get loading => isLoading;

  final FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseUser user;

  @action
  Future<void> signIn({User user, Function onFail, Function onSuccess}) async {
    try {
      final AuthResult result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      this.user = result.user;
      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
  }

  @action
  Future<void> loadCurrentUser() async {
    final FirebaseUser currentUser = await auth.currentUser();
    if (currentUser != null) {
      user = currentUser;
    }
  }
}
