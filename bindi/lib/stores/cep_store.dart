import 'package:bindi/models/adress.dart';
import 'package:bindi/repositories/cep_repository.dart';
import 'package:mobx/mobx.dart';

part 'cep_store.g.dart';

class CepStore = _CepStore with _$CepStore;

abstract class _CepStore with Store {
  _CepStore(String initialCep) {
    autorun((_) {
      if (clearCep.length != 8) {
      } else {
        _searchCep();
        _reset();
      }
    });
    setCep(initialCep);
  }
  @observable
  String cep = '';

  @action
  void setCep(String value) => cep = value;

  @computed
  String get clearCep => cep.replaceAll(RegExp('[^0-9]'), '');

  @observable
  Address address;

  @observable
  String error;

  @observable
  bool loading = false;

  @action
  Future<void> _searchCep() async {
    loading = true;
    try {
      address = await CepRepository().getAddressFromApi(clearCep);

      error = null;
    } catch (e) {
      error = e;
      address = null;
    }
    loading = false;
  }

  @action
  void _reset() {
    address = null;
    error = null;
  }
}
