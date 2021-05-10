import 'package:bindi/models/user.dart';
import 'package:bindi/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:bindi/helpers/extensions.dart';
part 'signup_store.g.dart';

class SignupStore = _SignupStore with _$SignupStore;

abstract class _SignupStore with Store {
  @observable
  String name;
  @observable
  String email;
  @observable
  String phone;
  @observable
  String password;
  @observable
  bool loading = false;

  @observable
  String confirmPassword;

  @action
  void setName(String value) => name = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPhone(String value) => phone = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void setConfirmPassword(String value) => confirmPassword = value;

  @computed
  bool get nameValid => name != null && name.length > 6;
  String get nameError {
    if (name == null || nameValid) {
      return null;
    } else if (name.isEmpty) {
      return 'Campo obrigatorio';
    } else {
      return 'Nome muito curto';
    }
  }

  @computed
  bool get emailValid => email != null && email.isEmailValid();
  String get emailError {
    if (email == null || emailValid) {
      return null;
    } else if (email.isEmpty) {
      return 'Campo obrigatorio';
    } else {
      return 'E-mail inválido';
    }
  }

  @computed
  bool get phoneValid => phone != null && phone.length >= 14;
  String get phoneError {
    if (phone == null || phoneValid) {
      return null;
    } else if (phone.isEmpty) {
      return 'Campo obrigatorio';
    } else {
      return 'Celular inválido';
    }
  }

  @computed
  bool get passwordValid => password != null && password.length >= 6;
  String get passwordError {
    if (password == null || passwordValid) {
      return null;
    } else if (password.isEmpty) {
      return 'Campo obrigatorio';
    } else {
      return 'Senha muito curta';
    }
  }

  @computed
  bool get confirmPasswordValid =>
      confirmPassword != null && confirmPassword == password;
  String get confirmPasswordError {
    if (confirmPassword == null || confirmPasswordValid) {
      return null;
    } else {
      return 'Senha não coincidem';
    }
  }

  @computed
  bool get isFormValid =>
      nameValid &&
      emailValid &&
      phoneValid &&
      passwordValid &&
      confirmPasswordValid;

  @computed
  Function get signUpPressed => (isFormValid && !loading) ? _signUp : null;

  @action
  Future<void> _signUp() async {
    loading = true;

    final user = User(
      name: name,
      email: email,
      phone: phone,
      password: password,
    );

    await UserRepository().signUp(user);

    loading = false;
  }
}
