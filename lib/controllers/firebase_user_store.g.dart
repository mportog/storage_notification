// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FirebaseUserStore on _FirebaseUserStoreBase, Store {
  final _$isLoadingAtom = Atom(name: '_FirebaseUserStoreBase.isLoading');

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

  final _$isLoggedInAtom = Atom(name: '_FirebaseUserStoreBase.isLoggedIn');

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

  final _$userAtom = Atom(name: '_FirebaseUserStoreBase.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$onlyEmailAtom = Atom(name: '_FirebaseUserStoreBase.onlyEmail');

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

  final _$signInAsyncAction = AsyncAction('_FirebaseUserStoreBase.signIn');

  @override
  Future<void> signIn({User user, Function onFail, Function onSuccess}) {
    return _$signInAsyncAction.run(
        () => super.signIn(user: user, onFail: onFail, onSuccess: onSuccess));
  }

  final _$_loadCurrentUserAsyncAction =
      AsyncAction('_FirebaseUserStoreBase._loadCurrentUser');

  @override
  Future<void> _loadCurrentUser({FirebaseUser firebaseUser}) {
    return _$_loadCurrentUserAsyncAction
        .run(() => super._loadCurrentUser(firebaseUser: firebaseUser));
  }

  final _$signUpAsyncAction = AsyncAction('_FirebaseUserStoreBase.signUp');

  @override
  Future<void> signUp({User user, Function onFail, Function onSuccess}) {
    return _$signUpAsyncAction.run(
        () => super.signUp(user: user, onFail: onFail, onSuccess: onSuccess));
  }

  final _$_FirebaseUserStoreBaseActionController =
      ActionController(name: '_FirebaseUserStoreBase');

  @override
  void signOut() {
    final _$actionInfo = _$_FirebaseUserStoreBaseActionController.startAction(
        name: '_FirebaseUserStoreBase.signOut');
    try {
      return super.signOut();
    } finally {
      _$_FirebaseUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isLoggedIn: ${isLoggedIn},
user: ${user},
onlyEmail: ${onlyEmail}
    ''';
  }
}
