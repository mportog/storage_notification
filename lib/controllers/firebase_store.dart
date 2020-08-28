import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:storagenotification/helpers/firebase_errors.dart';
import 'package:storagenotification/models/user.dart';
import 'package:mobx/mobx.dart';
part 'firebase_store.g.dart';

class FirebaseStore = _FirebaseStoreBase with _$FirebaseStore;

abstract class _FirebaseStoreBase with Store {
  _FirebaseStoreBase() {
    _loadCurrentUser();
  }
  @observable
  bool isLoading = false;

  set loading(bool value) => isLoading = value;
  bool get loading => isLoading;

  final FirebaseAuth auth = FirebaseAuth.instance;
  final Firestore firestore = Firestore.instance;
  User user;

  @observable
  bool loggedIn = false;

  bool get isLoggedIn => loggedIn = user != null;

  @action
  Future<void> signIn({User user, Function onFail, Function onSuccess}) async {
    try {
      loading = true;
      final AuthResult result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.password);
      await _loadCurrentUser(firebaseUser: result.user);
      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    } finally {
      loading = false;
    }
  }

  @action
  Future<void> _loadCurrentUser({FirebaseUser firebaseUser}) async {
    loading = true;
    final FirebaseUser currentUser = firebaseUser ?? await auth.currentUser();
    if (currentUser != null) {
      final DocumentSnapshot docUser =
          await firestore.collection('users').document(currentUser.uid).get();
      user = User.fromDocument(docUser);
    }
    loading = false;
  }

  @action
  Future<void> signUp({User user, Function onFail, Function onSuccess}) async {
    try {
      loading = true;
      final AuthResult result = await auth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);

      user.id = result.user.uid;

      await user.saveData();

      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    } finally {
      loading = false;
    }
  }

  void signOut() {
    auth.signOut();
    user = null;
  }
}
