// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateStore on _CreteStore, Store {
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

  final _$_CreteStoreActionController = ActionController(name: '_CreteStore');

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
  String toString() {
    return '''
category: ${category}
    ''';
  }
}
