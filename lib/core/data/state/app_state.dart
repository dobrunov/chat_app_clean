import 'dart:convert';
import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../features/chat/presentation/chat_state.dart';
import '../../../socket_messages/socket_messages_type.dart';
import '../services/websocket/message_manager.dart';

part 'app_state.g.dart';

//  dart run build_runner build --delete-conflicting-outputs

class AppState = AppStoreBase with _$AppState;

abstract class AppStoreBase with Store {
  final MessageManager messageManager;

  AppStoreBase(this.messageManager) {
    chatState.sendMessage = (message) => sendMessageToServer(message);
    _handleIncomingMessages();
    _handleConnectedState();
  }

  @observable
  ChatState chatState = ChatState();

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
          chatState.addMessageFromServer(decodedMessage['data']);
          break;
        default:
          log("[Unhandled message type]: ${decodedMessage['type']}");
      }
    });
  }

  @action
  void sendMessageToServer(Map<String, dynamic> message) {
    messageManager.sendMessage(message);
  }

  @action
  void methodOne() {
    //
  }

  @action
  void methodTwo(message) {
    //
  }
}
