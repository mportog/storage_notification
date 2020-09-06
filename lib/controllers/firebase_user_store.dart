import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:storagenotification/helpers/firebase_errors.dart';
import 'package:storagenotification/models/user.dart';
import 'package:mobx/mobx.dart';
part 'firebase_user_store.g.dart';

class FirebaseUserStore = _FirebaseUserStoreBase with _$FirebaseUserStore;

abstract class _FirebaseUserStoreBase with Store {
  _FirebaseUserStoreBase() {
    _loadCurrentUser();
  }
  @observable
  bool isLoading = false;

  set loading(bool value) => isLoading = value;
  bool get loading => isLoading;

  final FirebaseAuth auth = FirebaseAuth.instance;
  final Firestore firestore = Firestore.instance;

  @observable
  bool isLoggedIn = false;

  @observable
  User user = User();

  @observable
  bool onlyEmail = false;

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
      saveToken();
      isLoggedIn = true;
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
      isLoggedIn = true;
      await user.saveData();
      saveToken();
      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    } finally {
      loading = false;
    }
  }

  @action
  void signOut() {
    auth.signOut();
    isLoggedIn = false;
  }

  Future<void> deleteAccount() async {
    await firestore.collection('users').document(user.id).delete();
  }

  Future<void> resetPassword(
      {String mail, Function onFail, Function onSuccess}) async {
    try {
      if (onlyEmail) {
        loading = true;
        await auth.sendPasswordResetEmail(email: mail);
        onlyEmail = false;
        onSuccess();
      } else {
        onlyEmail = true;
      }
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    } finally {
      loading = false;
    }
  }

  Future<void> saveToken() async {
    final token = await FirebaseMessaging().getToken();
    await user.tokensReference.document(token).setData({
      'token': token,
      'updatedAt': FieldValue.serverTimestamp(),
      'platform': Platform.operatingSystem,
    });
  }
}
