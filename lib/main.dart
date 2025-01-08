import 'package:chat_app_clean/core/data/services/token/token_storage_service.dart';
import 'package:chat_app_clean/core/data/state/app_state.dart';
import 'package:chat_app_clean/features/login/data/data_sources/remote/api_service.dart';
import 'package:chat_app_clean/socket_messages/app_socket_messages.dart';
import 'package:chat_app_clean/socket_messages/app_socket_messages_impl.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'core/data/services/websocket/message_manager_impl.dart';
import 'core/data/services/websocket/websocket_client_impl.dart';
import 'features/chat/presentation/chat_state.dart';
import 'login_page.dart';

void main() async {
  await Hive.initFlutter();
  final tokenBox = await Hive.openBox<String>('token');
  final tokenStorageService = TokenStorageService(tokenBox: tokenBox);

  final webSocketClient = WebSocketClientImpl("ws://127.0.0.1:8080");
  final messageManager = MessageManagerImpl(webSocketClient);
  final appState = AppState(messageManager);

  final chatState = ChatState();
  chatState.sendMessage = (message) {
    debugPrint("Sending message: $message");
  };

  runApp(
    MultiProvider(
      providers: [
        Provider<AppState>(create: (_) => appState),
        Provider<ChatState>(create: (_) => chatState),
        Provider<AppSocketMessages>(create: (_) => AppSocketMessagesImpl(appState)),
        Provider<TokenStorageService>(create: (_) => tokenStorageService),
        Provider<ApiService>(create: (_) => ApiService(tokenStorageService: tokenStorageService)),
      ],
      child: MyApp(tokenStorageService: tokenStorageService),
    ),
  );
}

class MyApp extends StatelessWidget {
  final TokenStorageService tokenStorageService;

  const MyApp({super.key, required this.tokenStorageService});

  @override
  Widget build(BuildContext context) {
    const initialRoute = LoginPage();

    return MaterialApp(
      title: 'Basic WebSocket App with MobX',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: initialRoute,
    );
  }
}
