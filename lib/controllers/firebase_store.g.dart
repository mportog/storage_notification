// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FirebaseStore on _FirebaseStoreBase, Store {
  final _$isLoadingAtom = Atom(name: '_FirebaseStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$isLoggedInAtom = Atom(name: '_FirebaseStoreBase.isLoggedIn');

  @override
  bool get isLoggedIn {
    _$isLoggedInAtom.reportRead();
    return super.isLoggedIn;
  }

  @override
  set isLoggedIn(bool value) {
    _$isLoggedInAtom.reportWrite(value, super.isLoggedIn, () {
      super.isLoggedIn = value;
    });
  }

  final _$onlyEmailAtom = Atom(name: '_FirebaseStoreBase.onlyEmail');

  @override
  bool get onlyEmail {
    _$onlyEmailAtom.reportRead();
    return super.onlyEmail;
  }

  @override
  set onlyEmail(bool value) {
    _$onlyEmailAtom.reportWrite(value, super.onlyEmail, () {
      super.onlyEmail = value;
    });
  }

  final _$signInAsyncAction = AsyncAction('_FirebaseStoreBase.signIn');

  @override
  Future<void> signIn({User user, Function onFail, Function onSuccess}) {
    return _$signInAsyncAction.run(
        () => super.signIn(user: user, onFail: onFail, onSuccess: onSuccess));
  }

  final _$_loadCurrentUserAsyncAction =
      AsyncAction('_FirebaseStoreBase._loadCurrentUser');

  @override
  Future<void> _loadCurrentUser({FirebaseUser firebaseUser}) {
    return _$_loadCurrentUserAsyncAction
        .run(() => super._loadCurrentUser(firebaseUser: firebaseUser));
  }

  final _$signUpAsyncAction = AsyncAction('_FirebaseStoreBase.signUp');

  @override
  Future<void> signUp({User user, Function onFail, Function onSuccess}) {
    return _$signUpAsyncAction.run(
        () => super.signUp(user: user, onFail: onFail, onSuccess: onSuccess));
  }

  final _$_FirebaseStoreBaseActionController =
      ActionController(name: '_FirebaseStoreBase');

  @override
  void signOut() {
    final _$actionInfo = _$_FirebaseStoreBaseActionController.startAction(
        name: '_FirebaseStoreBase.signOut');
    try {
      return super.signOut();
    } finally {
      _$_FirebaseStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isLoggedIn: ${isLoggedIn},
onlyEmail: ${onlyEmail}
    ''';
  }
}
