import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketClientImpl {
  final String url;
  final String token;
  final int delay;
  int _reconnectAttempts = 0;
  static const int maxReconnectAttempts = 5;
  WebSocketChannel? _channel;
  final _controller = StreamController<String>.broadcast();
  final StreamController<bool> _connectionStateController = StreamController<bool>.broadcast();

  void _updateConnectionState(bool newState) => _connectionStateController.add(newState);

  WebSocketClientImpl(this.url, this.token, {this.delay = 5}) {
    _updateConnectionState(false);
    connect();
  }

  Stream<bool> get connectionStateStream => _connectionStateController.stream;

  void connect() {
    disconnect();

    final uri = Uri.parse('$url?token=$token');
    log('Connecting to WebSocket: $uri');
    _channel = WebSocketChannel.connect(uri);

    _channel?.stream.listen(
      _handleMessage,
      onError: _onConnectionError,
      onDone: _onConnectionDone,
    );
  }

  void _handleMessage(dynamic event) {
    _updateConnectionState(true);
    log('[Incoming message]: $event');
    _controller.add(event);
  }

  void _onConnectionError(Object error) {
    _updateConnectionState(false);
    log('[WebSocket Error]: $error');
    _controller.addError(error);
    _handleReconnect();
  }

  void _onConnectionDone() {
    _updateConnectionState(false);
    log('[WebSocket Disconnected]');
    _handleReconnect();
  }

  void _handleReconnect() async {
    if (_reconnectAttempts < maxReconnectAttempts) {
      _reconnectAttempts++;
      log('[Reconnecting... Attempt $_reconnectAttempts]');
      await Future.delayed(Duration(seconds: delay));
      connect();
    } else {
      log('[Reconnect failed after $maxReconnectAttempts attempts]');
    }
  }

  void disconnect() {
    _channel?.sink.close(status.normalClosure);
    _channel = null;
  }

  Stream<String> get messages => _controller.stream;

  void sendMessage(Map<String, dynamic> message) {
    final messageJson = jsonEncode(message);
    log('[Sending message]: $messageJson');
    _channel?.sink.add(messageJson);
  }

  void dispose() {
    disconnect();
    _controller.close();
    _connectionStateController.close();
  }
}
