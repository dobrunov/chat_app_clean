import 'package:hive/hive.dart';

class DataBaseService {
  late Box<String> tokenBox;

  DataBaseService({
    required this.tokenBox,
  });

  Future<void> saveToken(String newToken) async {
    await tokenBox.put('token', newToken);
  }

  Future<String?> getToken() async {
    return tokenBox.get('token');
  }
}
