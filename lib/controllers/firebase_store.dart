import 'package:storagenotification/repositories/firebase_repository.dart';
import 'package:storagenotification/models/user.dart';
import 'package:mobx/mobx.dart';
part 'firebase_store.g.dart';

class FirebaseStore = _FirebaseStoreBase with _$FirebaseStore;

abstract class _FirebaseStoreBase with Store {
  FirebaseRepository _firebaseRepository;

  _FirebaseStoreBase() {
    _firebaseRepository = FirebaseRepository();
  }
  @observable
  bool isLoading = false;

  set loading(bool value) => isLoading = value;
  bool get loading => isLoading;

  @action
  Future<void> signIn({User user, Function onFail, Function onSuccess}) async {
    await _firebaseRepository.signIn(user, onFail, onSuccess);
  }
}
