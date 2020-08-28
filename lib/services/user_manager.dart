class UserManager {
  static final UserManager _singleton = UserManager._internal();
  UserManager._internal();
  static UserManager getInstance() => _singleton;
}
