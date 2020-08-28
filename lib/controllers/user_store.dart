import 'package:mobx/mobx.dart';
part 'user_store.g.dart';

class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  @observable
  bool isVisible = false;

  @action
  set visible(bool visible) => isVisible = visible;

  @action
  bool get visible => isVisible;
}
