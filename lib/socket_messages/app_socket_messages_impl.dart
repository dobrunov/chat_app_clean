import 'package:chat_app_clean/socket_messages/socket_messages_type.dart';

import '../core/data/state/app_state.dart';
import 'app_socket_messages.dart';

class AppSocketMessagesImpl implements AppSocketMessages {
  final AppState appState;

  AppSocketMessagesImpl(this.appState);

  @override
  void methodOne() {
    appState.methodOne();
  }

  @override
  void methodTwo() {
    var message = {
      "type": SocketMessagesType.typeOne,
      "data": "dataOne",
    };
    appState.methodTwo(message);
  }
}
