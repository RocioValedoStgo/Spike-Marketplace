import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pageview_app/src/models/User.dart';

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
      final jsonRes = jsonDecode(response.body);
      User user = User.fromJson(jsonRes['data']);
      print(user.username);
      Navigator.pushNamed(context, '/home', arguments: user);
    } else {
      print(response.body);
    }
  }

  Future<void> login(BuildContext context,
      {@required Map<String, dynamic> params}) async {
    await dotenv.load(fileName: "assets/.env");
    Map<String, dynamic> request = {
      "username": params['username'],
      "password": params['password']
    };
    var uri = Uri.http(dotenv.env['HOST'], "/api/login", request);
    final response = await http.post(uri);
    if (response.statusCode == 200) {
      final jsonRes = jsonDecode(response.body);
      User user = User.fromJson(jsonRes['data']);
      print(user.username);
      Navigator.pushNamed(context, '/home', arguments: user);
    } else {
      print(response.body);
    }
  }
}
