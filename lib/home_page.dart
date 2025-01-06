import 'package:chat_app_clean/core/data/state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'features/chat/presentation/chat_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late AppState appState;
  late ChatState chatState;

  @override
  void didChangeDependencies() {
    appState = context.watch<AppState>();
    chatState = context.watch<ChatState>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(2.0),
              child: Text('Connected'),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Observer(builder: (context) {
                return Text(
                  appState.connected.toString(),
                );
              }),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Message'),
            ),
            Observer(builder: (context) {
              return Text(
                chatState.message.toString(),
                style: Theme.of(context).textTheme.headlineMedium,
              );
            }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => chatState.sendChatMessage("TestMessage"),
                child: const Text('Action 1'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
