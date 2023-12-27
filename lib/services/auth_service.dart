import 'dart:convert';

import 'package:apiauthjwtdemo/api/api.dart';
import 'package:apiauthjwtdemo/models/usermodel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final client = http.Client();

  Future<UserModel?> login(String username, String password) async {
    final Map<String, dynamic> body = {
      'username': username,
      'password': password
    };

    print(body);
    try {
      final response =
          await client.post(Uri.parse("${API().baseUrl}${API().authUrl}"),
              headers: {
                'Content-Type': 'application/json',
              },
              body: jsonEncode(body));

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        final UserModel user = UserModel.fromJson(result);

        SharedPreferences _pref = await SharedPreferences.getInstance();

        _pref.setString('token', user.token.toString());

        return user;
      } else {
        print("Request Failed with status code${response.statusCode}");
      }
    } catch (error) {
      print("$error");
    }
  }
}
