import 'package:flutter/material.dart';
import 'package:pageview_app/src/services/AuthService.dart';

class Register extends StatelessWidget {
  final _username = TextEditingController();
  final _pwd = TextEditingController();
  final _email = TextEditingController();

  final _formLogin = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.all(20.0),
                  child: Image.asset('assets/images/logoSpike.png'),
                  height: 110.0,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  margin: EdgeInsets.all(15),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20.0),
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(38, 193, 101, 1)),
                        ),
                      ),
                      Form(
                          key: _formLogin,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(20.0),
                                child: _usernameField(_username),
                              ),
                              Padding(
                                padding: EdgeInsets.all(20.0),
                                child: _emailField(_email),
                              ),
                              Padding(
                                padding: EdgeInsets.all(20.0),
                                child: _passwordField(_pwd),
                              ),
                              Padding(
                                padding: EdgeInsets.all(20.0),
                                child: SizedBox(
                                  height: 50,
                                  width: 400,
                                  child: ElevatedButton(
                                    child: Text(
                                      'Submit',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    onPressed: () {
                                      if (_formLogin.currentState.validate()) {
                                        AuthService authS = new AuthService();
                                        Map<String, dynamic> request = {
                                          "username": _username.text,
                                          "email": _email.text,
                                          "password": _pwd.text,
                                        };
                                        authS.register(context,
                                            params: request);
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _usernameField(_username) {
  return TextFormField(
    controller: _username,
    decoration: InputDecoration(labelText: 'Please enter your username'),
    validator: (v) {
      if (isValidUsername(_username.text)) {
        return null;
      } else if (v.isEmpty) {
        return 'Please enter some username';
      } else {
        return 'Please enter a valid username';
      }
    },
  );
}

Widget _emailField(_email) {
  return TextFormField(
    controller: _email,
    decoration: InputDecoration(labelText: 'Please enter your email'),
    validator: (v) {
      if (isValidEmail(_email.text)) {
        return null;
      } else if (v.isEmpty) {
        return 'Please enter some username';
      } else {
        return 'Please enter a valid username';
      }
    },
  );
}

Widget _passwordField(_pwd) {
  return TextFormField(
    controller: _pwd,
    decoration: InputDecoration(labelText: 'Please enter your password'),
    obscureText: true,
    validator: (v) {
      if (isValidPassword(_pwd.text)) {
        return null;
      } else if (v.isEmpty) {
        return 'Please enter some password';
      } else {
        return 'Please enter a valid password';
      }
    },
  );
}

bool isValidUsername(String username) {
  final usernameRegExp = RegExp(r"[a-zA-Z0-9._]{8,30}$");
  return usernameRegExp.hasMatch(username);
}

bool isValidEmail(String email) {
  final emailRegExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  return emailRegExp.hasMatch(email);
}

bool isValidPassword(String password) {
  final passwordRegExp = RegExp(
      r"(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%^&*._-]).{8,30}$");
  return passwordRegExp.hasMatch(password);
}
