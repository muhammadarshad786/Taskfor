import 'dart:convert';
import 'package:http/http.dart' as http;

class UserService {
  final String baseUrl = 'https://67931eae5eae7e5c4d8d9ca4.mockapi.io/task/auth/email';

  Future<bool> login(String email, String password) async {
    final response = await http.get(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> users = jsonDecode(response.body);
      final matchedUser = users.firstWhere(
        (user) => user['email'] == email && user['password'] == password,
        orElse: () => null,
      );

      if (matchedUser != null) {
        return true;
      } else {
        throw Exception('Invalid email or password');
      }
    } else {
      throw Exception('Failed to fetch users: ${response.statusCode}');
    }
  }
}