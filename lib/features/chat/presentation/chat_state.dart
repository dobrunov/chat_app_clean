import 'package:mobx/mobx.dart';

part 'chat_state.g.dart';

class ChatState = ChatStoreBase with _$ChatState;

abstract class ChatStoreBase with Store {
  late Function(Map<String, dynamic>) sendMessage;

  @observable
  String message = '';

  @action
  void sendChatMessage(String message) {
    if (message.isNotEmpty) {
      sendMessage({
        "type": "NewMessage",
        "data": message,
      });
    }
  }

  @action
  void deleteChatMessage(int id) {
    sendMessage({
      "type": "NewMessage",
      "data": id,
    });
  }

  @action
  void addMessageFromServer(data) {
    message = data;
  }
}
