import 'package:flutter/material.dart';
import 'package:pageview_app/src/services/AuthService.dart';

class Login extends StatelessWidget {
  final _username = TextEditingController();
  final _password = TextEditingController();
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
                          'Sign In',
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
                              child: _passwordField(_password),
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
                                  style: ElevatedButton.styleFrom(
                                    primary: Color.fromRGBO(38, 193, 101, 1),
                                  ),
                                  onPressed: () {
                                    if (_formLogin.currentState.validate()) {
                                      AuthService authS = new AuthService();
                                      Map<String, dynamic> request = {
                                        "username": _username.text,
                                        "password": _password.text,
                                      };
                                      authS.login(context, params: request);
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: SizedBox(
                    height: 50,
                    width: 400,
                    child: ElevatedButton(
                      child: Text(
                        'Create an account',
                        style: TextStyle(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Color.fromRGBO(38, 193, 101, 1),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                    ),
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
        return getHintsUsername(_username.text);
      }
    },
  );
}

Widget _passwordField(_password) {
  return TextFormField(
    controller: _password,
    decoration: InputDecoration(labelText: 'Please enter your password'),
    obscureText: true,
    validator: (v) {
      if (isValidPassword(_password.text)) {
        return null;
      } else if (v.isEmpty) {
        return 'Please enter some password';
      } else {
        return getHintsPassword(_password.text);
      }
    },
  );
}

bool isValidUsername(String username) {
  final usernameRegExp = RegExp(r'(?=.{8,20}$)[a-zA-Z0-9]+[a-zA-Z0-9]+$');
  if (usernameRegExp.hasMatch(username) &&
      username.length <= 30 &&
      username.length >= 8) {
    return true;
  }
  return false;
}

bool isValidPassword(String password) {
  print(password + " " + password.contains(new RegExp(' ')).toString());
  final passwordRegExp = RegExp(
      r'^(?=.*[a-zA-Z])(?=.*["#$@$!%*?\$^&._-])[A-Za-z\d$@$!%*?&]{8,30}');
  if (passwordRegExp.hasMatch(password) &&
      password.length <= 30 &&
      password.length >= 8 &&
      !password.contains(new RegExp(' '))) {
    return true;
  }
  return false;
}

String getHintsUsername(String _username) {
  String hints = "";
  print(_username + " \n" + _username.length.toString());
  if (!_username.contains(new RegExp(r'[a-zA-Z]'))) {
    hints = hints + "A letter is missing \n";
  }
  if (_username.contains(new RegExp(r'[\s]'))) {
    hints = hints + "White spaces are not accepted \n";
  }
  if (_username.contains(new RegExp(r'[^a-zA-Z0-9]+'))) {
    hints = hints + "Special characters  are not accepted \n";
  }
  if (_username.length < 8 || _username.length > 30) {
    hints =
        hints + " Maximum length of 30 characters and minimum 8 characters\n";
  }
  return hints;
}

String getHintsPassword(String _password) {
  print(_password + "\nlength" + _password.length.toString());
  String hints = "";
  if (!_password.contains(new RegExp(r'[a-zA-Z]'))) {
    hints = hints + "A letter is missing \n";
  }
  if (_password.contains(new RegExp(' '))) {
    hints = hints + "White spaces are not accepted \n";
  }
  if (!_password.contains(new RegExp(r'[^a-zA-Z0-9]+'))) {
    hints = hints + "A special characters is mising  \n";
  }
  if (_password.length < 8 || _password.length > 30) {
    hints =
        hints + "Maximum length of 30 characters and minimum 8 characters\n";
  }
  return hints;
}
