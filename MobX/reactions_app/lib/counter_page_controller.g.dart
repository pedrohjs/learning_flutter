// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CounterPageController on _CounterPageController, Store {
  Computed<bool> _$isEvenComputed;

  @override
  bool get isEven => (_$isEvenComputed ??= Computed<bool>(() => super.isEven,
          name: '_CounterPageController.isEven'))
      .value;

  final _$counterAtom = Atom(name: '_CounterPageController.counter');

  @override
  int get counter {
    _$counterAtom.reportRead();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.reportWrite(value, super.counter, () {
      super.counter = value;
    });
  }

  final _$_CounterPageControllerActionController =
      ActionController(name: '_CounterPageController');

  @override
  void increment() {
    final _$actionInfo = _$_CounterPageControllerActionController.startAction(
        name: '_CounterPageController.increment');
    try {
      return super.increment();
    } finally {
      _$_CounterPageControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
counter: ${counter},
isEven: ${isEven}
    ''';
  }
}
