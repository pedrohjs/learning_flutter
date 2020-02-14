// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Controller on ControllerBase, Store {
  Computed<String> _$fullNameComputed;

  @override
  String get fullName =>
      (_$fullNameComputed ??= Computed<String>(() => super.fullName)).value;

  final _$nameAtom = Atom(name: 'ControllerBase.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$lastNameAtom = Atom(name: 'ControllerBase.lastName');

  @override
  String get lastName {
    _$lastNameAtom.context.enforceReadPolicy(_$lastNameAtom);
    _$lastNameAtom.reportObserved();
    return super.lastName;
  }

  @override
  set lastName(String value) {
    _$lastNameAtom.context.conditionallyRunInAction(() {
      super.lastName = value;
      _$lastNameAtom.reportChanged();
    }, _$lastNameAtom, name: '${_$lastNameAtom.name}_set');
  }

  final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase');

  @override
  dynamic changeName(String newName) {
    final _$actionInfo = _$ControllerBaseActionController.startAction();
    try {
      return super.changeName(newName);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeLastName(String newLastName) {
    final _$actionInfo = _$ControllerBaseActionController.startAction();
    try {
      return super.changeLastName(newLastName);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'name: ${name.toString()},lastName: ${lastName.toString()},fullName: ${fullName.toString()}';
    return '{$string}';
  }
}
