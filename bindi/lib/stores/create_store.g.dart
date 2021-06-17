// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateStore on _CreteStore, Store {
  Computed<bool> _$imagesValidComputed;

  @override
  bool get imagesValid =>
      (_$imagesValidComputed ??= Computed<bool>(() => super.imagesValid,
              name: '_CreteStore.imagesValid'))
          .value;
  Computed<bool> _$titleValidComputed;

  @override
  bool get titleValid =>
      (_$titleValidComputed ??= Computed<bool>(() => super.titleValid,
              name: '_CreteStore.titleValid'))
          .value;
  Computed<bool> _$descriptionValidComputed;

  @override
  bool get descriptionValid => (_$descriptionValidComputed ??= Computed<bool>(
          () => super.descriptionValid,
          name: '_CreteStore.descriptionValid'))
      .value;
  Computed<bool> _$categoryValidComputed;

  @override
  bool get categoryValid =>
      (_$categoryValidComputed ??= Computed<bool>(() => super.categoryValid,
              name: '_CreteStore.categoryValid'))
          .value;
  Computed<Address> _$addressComputed;

  @override
  Address get address => (_$addressComputed ??=
          Computed<Address>(() => super.address, name: '_CreteStore.address'))
      .value;
  Computed<num> _$priceComputed;

  @override
  num get price => (_$priceComputed ??=
          Computed<num>(() => super.price, name: '_CreteStore.price'))
      .value;
  Computed<bool> _$formValidComputed;

  @override
  bool get formValid => (_$formValidComputed ??=
          Computed<bool>(() => super.formValid, name: '_CreteStore.formValid'))
      .value;
  Computed<Function> _$sendPressedComputed;

  @override
  Function get sendPressed =>
      (_$sendPressedComputed ??= Computed<Function>(() => super.sendPressed,
              name: '_CreteStore.sendPressed'))
          .value;

  final _$titleAtom = Atom(name: '_CreteStore.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$descriptionAtom = Atom(name: '_CreteStore.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$categoryAtom = Atom(name: '_CreteStore.category');

  @override
  Category get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(Category value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  final _$priceTextAtom = Atom(name: '_CreteStore.priceText');

  @override
  String get priceText {
    _$priceTextAtom.reportRead();
    return super.priceText;
  }

  @override
  set priceText(String value) {
    _$priceTextAtom.reportWrite(value, super.priceText, () {
      super.priceText = value;
    });
  }

  final _$hidePhoneAtom = Atom(name: '_CreteStore.hidePhone');

  @override
  bool get hidePhone {
    _$hidePhoneAtom.reportRead();
    return super.hidePhone;
  }

  @override
  set hidePhone(bool value) {
    _$hidePhoneAtom.reportWrite(value, super.hidePhone, () {
      super.hidePhone = value;
    });
  }

  final _$showErrorsAtom = Atom(name: '_CreteStore.showErrors');

  @override
  bool get showErrors {
    _$showErrorsAtom.reportRead();
    return super.showErrors;
  }

  @override
  set showErrors(bool value) {
    _$showErrorsAtom.reportWrite(value, super.showErrors, () {
      super.showErrors = value;
    });
  }

  final _$_CreteStoreActionController = ActionController(name: '_CreteStore');

  @override
  void setTitle(String value) {
    final _$actionInfo =
        _$_CreteStoreActionController.startAction(name: '_CreteStore.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_CreteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_CreteStoreActionController.startAction(
        name: '_CreteStore.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_CreteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategory(Category value) {
    final _$actionInfo = _$_CreteStoreActionController.startAction(
        name: '_CreteStore.setCategory');
    try {
      return super.setCategory(value);
    } finally {
      _$_CreteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrice(String value) {
    final _$actionInfo =
        _$_CreteStoreActionController.startAction(name: '_CreteStore.setPrice');
    try {
      return super.setPrice(value);
    } finally {
      _$_CreteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHidePhone(bool value) {
    final _$actionInfo = _$_CreteStoreActionController.startAction(
        name: '_CreteStore.setHidePhone');
    try {
      return super.setHidePhone(value);
    } finally {
      _$_CreteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo = _$_CreteStoreActionController.startAction(
        name: '_CreteStore.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$_CreteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
description: ${description},
category: ${category},
priceText: ${priceText},
hidePhone: ${hidePhone},
showErrors: ${showErrors},
imagesValid: ${imagesValid},
titleValid: ${titleValid},
descriptionValid: ${descriptionValid},
categoryValid: ${categoryValid},
address: ${address},
price: ${price},
formValid: ${formValid},
sendPressed: ${sendPressed}
    ''';
  }
}
