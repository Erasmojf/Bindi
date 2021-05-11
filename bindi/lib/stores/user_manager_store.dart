import 'package:bindi/models/user.dart';
import 'package:mobx/mobx.dart';
part 'user_manager_store.g.dart';

class UserManagerStore = _UserManagerStore with _$UserManagerStore;

abstract class _UserManagerStore with Store{

  @observable
  User user;

  @action
  void setUser(User value) => user = value;

  @computed
  bool get isLoggedIn => user != null;

}