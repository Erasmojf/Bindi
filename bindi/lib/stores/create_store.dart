import 'package:bindi/models/ad.dart';
import 'package:bindi/models/adress.dart';
import 'package:bindi/models/category.dart';
import 'package:bindi/repositories/ad_repository.dart';
import 'package:bindi/stores/user_manager_store.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import 'cep_store.dart';

part 'create_store.g.dart';

class CreateStore = _CreteStore with _$CreateStore;

abstract class _CreteStore with Store {
  _CreteStore(Ad ad) {
    title = ad.title;
    description = ad.description;
    images = ad.images.asObservable();
    category = ad.category;
    priceText = '${ad.price?.toStringAsFixed(2)}';
    hidePhone = ad.hidePhone;

    if (ad.address != null)
      cepStore = CepStore(ad.address.cep);
    else
      cepStore = CepStore(null);
  }

  ObservableList images = ObservableList();

  @computed
  bool get imagesValid => images.isNotEmpty;
  String get imagesError {
    if (!showErrors || imagesValid)
      return null;
    else
      return 'Insira imagens';
  }

  @observable
  String title = '';

  @action
  void setTitle(String value) => title = value;

  @computed
  bool get titleValid => title.length >= 6;
  String get titileError {
    if (!showErrors || titleValid)
      return null;
    else if (title.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Título muito curto';
  }

  @observable
  String description = '';

  @action
  void setDescription(String value) => description = value;

  @computed
  bool get descriptionValid => description.length >= 10;
  String get descriptionError {
    if (!showErrors || descriptionValid)
      return null;
    else if (description.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Descrição muito curto';
  }

  @observable
  Category category;

  @action
  void setCategory(Category value) => category = value;

  @computed
  bool get categoryValid => category != null;
  String get categoryError {
    if (!showErrors || categoryValid)
      return null;
    else
      return 'Campo obrigatório';
  }

  CepStore cepStore;

  @computed
  Address get address => cepStore.address;
  bool get addressValid => address != null;
  String get addressError {
    if (!showErrors || addressValid)
      return null;
    else
      return 'Campo obrigatório';
  }

  @observable
  String priceText = '';

  @action
  void setPrice(String value) => priceText = value;

  @computed
  num get price {
    if (priceText.contains(',')) {
      return num.tryParse(priceText.replaceAll(RegExp('[^0-9]'), '')) / 100;
    } else {
      return num.tryParse(priceText);
    }
  }

  bool get priceValid => price != null && price <= 9999999;
  String get priceError {
    if (!showErrors || priceValid)
      return null;
    else if (priceText.isEmpty)
      return 'Campo obrigatório';
    else
      return 'Preço inválido';
  }

  @observable
  bool hidePhone = false;

  @action
  void setHidePhone(bool value) => hidePhone = value;

  @computed
  bool get formValid =>
      imagesValid &&
      titleValid &&
      descriptionValid &&
      categoryValid &&
      addressValid &&
      priceValid;

  @computed
  Function get sendPressed => formValid ? _send : null;

  @observable
  bool showErrors = false;

  @action
  void invalidSendPressed() => showErrors = true;

  @observable
  bool loading = false;

  @observable
  String error;

  @observable
  bool savedAd = false;

  @action
  Future<void> _send() async {
    final ad = Ad();

    ad.title = title;
    ad.description = description;
    ad.category = category;
    ad.price = price;
    ad.hidePhone = hidePhone;
    ad.images = images;
    ad.address = address;
    ad.user = GetIt.I<UserManagerStore>().user;

    loading = true;
    try {
      await AdRepository().save(ad);
      savedAd = true;
    } catch (e) {
      error = e;
    }
    loading = false;
  }
}
