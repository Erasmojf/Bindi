import 'package:mobx/mobx.dart';

part 'create_store.g.dart';

class CreateStore = _CreteStore with _$CreateStore;

abstract class _CreteStore with Store {
  ObservableList images = ObservableList();
}
