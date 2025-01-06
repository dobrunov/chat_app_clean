import 'package:hive/hive.dart';

class TokenStorageService {
  late Box<String> tokenBox;

  TokenStorageService({
    required this.tokenBox,
  });

  Future<void> saveToken(String newToken) async {
    await tokenBox.put('token', newToken);
  }

  Future<String?> getToken() async {
    return tokenBox.get('token');
  }
}
