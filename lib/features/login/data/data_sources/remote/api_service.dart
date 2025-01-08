import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../../../../core/constants.dart';
import '../../../../../core/data/services/token/token_storage_service.dart';

class ApiService {
  final TokenStorageService tokenStorageService;

  ApiService({required this.tokenStorageService});

  Future<String?> login(String username) async {
    const baseUrl = MyConstants.baseUrlAPI;
    final url = Uri.parse('$baseUrl/login');
    final body = jsonEncode({
      'username': username,
    });

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      if (response.statusCode == 200) {
        log(response.statusCode.toString());

        final data = jsonDecode(response.body);
        await tokenStorageService.saveToken(data['token']);
        return data['token'];
      } else {
        throw Exception('Login failed with status code ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error during login: $e');
    }
  }

  Future<void> logout(String token) async {
    const baseUrl = MyConstants.baseUrlAPI;
    final url = Uri.parse('$baseUrl/logout');

    final token = await tokenStorageService.getToken();

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": token.toString(),
        },
      );

      if (response.statusCode == 200) {
        log('Logout successful');
      } else {
        throw Exception('Logout failed with status code ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error during logout: $e');
    }
  }
}
