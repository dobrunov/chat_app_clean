// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppState on AppStoreBase, Store {
  late final _$counterAtom = Atom(name: 'AppStoreBase.counter', context: context);

  @override
  int get param {
    _$counterAtom.reportRead();
    return super.param;
  }

  @override
  set param(int value) {
    _$counterAtom.reportWrite(value, super.param, () {
      super.param = value;
    });
  }

  late final _$connectedAtom = Atom(name: 'AppStoreBase.connected', context: context);

  @override
  bool get connected {
    _$connectedAtom.reportRead();
    return super.connected;
  }

  @override
  set connected(bool value) {
    _$connectedAtom.reportWrite(value, super.connected, () {
      super.connected = value;
    });
  }

  late final _$AppStoreBaseActionController = ActionController(name: 'AppStoreBase', context: context);

  @override
  dynamic updateConnectedState(dynamic connectedState) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(name: 'AppStoreBase.updateConnectedState');
    try {
      return super.updateConnectedState(connectedState);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateParam(dynamic data) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(name: 'AppStoreBase.updateCounter');
    try {
      return super.updateParam(data);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void methodOne() {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(name: 'AppStoreBase.incrementCounter');
    try {
      return super.methodOne();
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateServerParam(Map<String, String> message) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(name: 'AppStoreBase.incrementServerCounter');
    try {
      return super.updateServerParam(message);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
counter: ${param},
connected: ${connected}
    ''';
  }
}
