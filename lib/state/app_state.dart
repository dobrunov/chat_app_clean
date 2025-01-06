import 'dart:convert';
import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../message_manager/message_manager.dart';
import '../socket_messages/socket_messages_type.dart';

part 'app_state.g.dart';

class AppState = AppStoreBase with _$AppState;

abstract class AppStoreBase with Store {
  final MessageManager messageManager;

  AppStoreBase(this.messageManager) {
    _handleIncomingMessages();
    _handleConnectedState();
  }

  @observable
  int param = 0;

  @observable
  bool connected = false;

  _handleConnectedState() {
    messageManager.connectionStateStream.listen((connectedState) {
      log("Connected state changed to: $connectedState");
      updateConnectedState(connectedState);
    });
  }

  @action
  updateConnectedState(connectedState) {
    connected = connectedState;
  }

  void _handleIncomingMessages() {
    messageManager.incomingMessages.listen((message) {
      final decodedMessage = jsonDecode(message);

      switch (decodedMessage['type']) {
        case SocketMessagesType.updateOne:
          updateParam(decodedMessage['data']);
          break;
        default:
          log("[Unhandled message type]: ${decodedMessage['type']}");
      }
    });
  }

  @action
  void updateParam(data) {
    param = param + 1;
  }

  @action
  void methodOne() {
    param++;
  }

  @action
  void updateServerParam(Map<String, String> message) {
    messageManager.sendMessage(message);
  }
}
