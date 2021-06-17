import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthService {
  Future<void> register(BuildContext context,
      {@required Map<String, dynamic> params}) async {
    await dotenv.load(fileName: "assets/.env");
    Map<String, dynamic> request = {
      "username": params['username'],
      "email": params['email'],
      "password": params['password']
    };
    var uri = Uri.http(dotenv.env['HOST'], "/api/register", request);
    final response = await http.post(uri);
    if (response.statusCode == 201) {
      print(response.body);
    } else {
      print(response.body);
    }
  }
}
