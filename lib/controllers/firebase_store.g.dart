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

  final _$loggedInAtom = Atom(name: '_FirebaseStoreBase.loggedIn');

  @override
  bool get loggedIn {
    _$loggedInAtom.reportRead();
    return super.loggedIn;
  }

  @override
  set loggedIn(bool value) {
    _$loggedInAtom.reportWrite(value, super.loggedIn, () {
      super.loggedIn = value;
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

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
loggedIn: ${loggedIn}
    ''';
  }
}
