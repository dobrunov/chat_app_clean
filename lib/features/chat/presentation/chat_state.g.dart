// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChatState on ChatStoreBase, Store {
  late final _$messageAtom =
      Atom(name: 'ChatStoreBase.message', context: context);

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$ChatStoreBaseActionController =
      ActionController(name: 'ChatStoreBase', context: context);

  @override
  void sendChatMessage(String message) {
    final _$actionInfo = _$ChatStoreBaseActionController.startAction(
        name: 'ChatStoreBase.sendChatMessage');
    try {
      return super.sendChatMessage(message);
    } finally {
      _$ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteChatMessage(int id) {
    final _$actionInfo = _$ChatStoreBaseActionController.startAction(
        name: 'ChatStoreBase.deleteChatMessage');
    try {
      return super.deleteChatMessage(id);
    } finally {
      _$ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addMessageFromServer(dynamic data) {
    final _$actionInfo = _$ChatStoreBaseActionController.startAction(
        name: 'ChatStoreBase.addMessageFromServer');
    try {
      return super.addMessageFromServer(data);
    } finally {
      _$ChatStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
message: ${message}
    ''';
  }
}
