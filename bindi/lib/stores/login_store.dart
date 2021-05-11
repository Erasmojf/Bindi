import 'package:bindi/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:bindi/helpers/extensions.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  @observable
  String email;
  @observable
  String password;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get emailValid => email != null && email.isEmailValid();

  String get emailError =>
      email == null || emailValid ? null : 'E-mail inválido';

  @computed
  bool get passwordValid => password != null && password.length >= 6;

  String get passwordError =>
      password == null || passwordValid ? null : 'Senha inválido';

  @computed
  Function get loginPressed => emailValid && passwordValid ? _login : null;

  @observable
  bool loading = false;

  @observable
  String error;

  @action
  Future<void> _login() async {
    loading = true;

    try {
      final user = await UserRepository().loginWithEmail(email, password);
    } catch (e) {
      error = e;
    }

    loading = false;
  }
}
