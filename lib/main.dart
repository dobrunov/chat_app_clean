import 'package:chat_app_clean/services/api_service.dart';
import 'package:chat_app_clean/services/data_base_service.dart';
import 'package:chat_app_clean/socket_messages/app_socket_messages.dart';
import 'package:chat_app_clean/socket_messages/app_socket_messages_impl.dart';
import 'package:chat_app_clean/state/app_state.dart';
import 'package:chat_app_clean/websocket_client/websocket_client_impl.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';
import 'message_manager/message_manager_impl.dart';

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
        Provider<DataBaseService>(create: (_) => DataBaseService(tokenBox: tokenBox)),
        Provider<ApiService>(create: (_) => ApiService(dataBaseService: DataBaseService(tokenBox: tokenBox))),
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
