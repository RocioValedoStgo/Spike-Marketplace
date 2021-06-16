import 'package:flutter/material.dart';

import 'src/pages/home.dart';
import 'src/pages/login.dart';
import 'src/pages/register.dart';

void main() {
  runApp(MaterialApp(
    title: 'Spike',
    theme: ThemeData(primaryColor: Color.fromRGBO(38, 193, 101, 1)),
    initialRoute: '/',
    routes: {
      '/': (context) => Login(),
      '/register': (context) => Register(),
      '/home': (context) => Home(),
    },
  ));
}