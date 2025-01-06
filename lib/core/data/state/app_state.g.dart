// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppState on AppStoreBase, Store {
  late final _$chatStateAtom =
      Atom(name: 'AppStoreBase.chatState', context: context);

  @override
  ChatState get chatState {
    _$chatStateAtom.reportRead();
    return super.chatState;
  }

  @override
  set chatState(ChatState value) {
    _$chatStateAtom.reportWrite(value, super.chatState, () {
      super.chatState = value;
    });
  }

  late final _$connectedAtom =
      Atom(name: 'AppStoreBase.connected', context: context);

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

  late final _$AppStoreBaseActionController =
      ActionController(name: 'AppStoreBase', context: context);

  @override
  dynamic updateConnectedState(dynamic connectedState) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.updateConnectedState');
    try {
      return super.updateConnectedState(connectedState);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sendMessageToServer(Map<String, dynamic> message) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.sendMessageToServer');
    try {
      return super.sendMessageToServer(message);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void methodOne() {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.methodOne');
    try {
      return super.methodOne();
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void methodTwo(dynamic message) {
    final _$actionInfo = _$AppStoreBaseActionController.startAction(
        name: 'AppStoreBase.methodTwo');
    try {
      return super.methodTwo(message);
    } finally {
      _$AppStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
chatState: ${chatState},
connected: ${connected}
    ''';
  }
}
