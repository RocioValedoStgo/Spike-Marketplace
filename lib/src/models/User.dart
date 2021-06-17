import 'package:flutter/foundation.dart';

class User {
  final int userId;
  final String name;
  final String lastName;
  final String username;
  final String email;
  final bool verified;
  final String token;
  final String created;
  final String updated;

  User(
      {@required this.userId,
      @required this.name,
      @required this.lastName,
      @required this.username,
      @required this.email,
      @required this.verified,
      @required this.token,
      @required this.created,
      @required this.updated});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        userId: json['id'] as int,
        name: json['name'] as String,
        lastName: json['last_name'] as String,
        username: json['username'] as String,
        email: json['email'] as String,
        verified: json['email_verified_at'] as bool,
        token: json['token'] as String,
        created: json['created_at'] as String,
        updated: json['updated_at'] as String);
  }
}
