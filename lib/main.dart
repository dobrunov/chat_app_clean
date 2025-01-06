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
import 'home_page.dart';

void main() async {
  await Hive.initFlutter();
  final tokenBox = await Hive.openBox<String>('token');

  final webSocketClient = WebSocketClientImpl("ws://127.0.0.1:8080");
  final messageManager = MessageManagerImpl(webSocketClient);
  final appState = AppState(messageManager);

  runApp(
    MultiProvider(
      providers: [
        Provider<AppState>(create: (_) => appState),
        Provider<AppSocketMessages>(create: (_) => AppSocketMessagesImpl(appState)),
        Provider<TokenStorageService>(create: (_) => TokenStorageService(tokenBox: tokenBox)),
        Provider<ApiService>(create: (_) => ApiService(tokenStorageService: TokenStorageService(tokenBox: tokenBox))),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic WebSocket App with MobX',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}
