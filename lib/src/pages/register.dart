import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  final _username = TextEditingController();
  final _pwd = TextEditingController();
  final _email = TextEditingController();
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
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: TextField(
                          controller: _username,
                          decoration: InputDecoration(
                              labelText: 'Please enter your username'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: TextField(
                          controller: _email,
                          decoration: InputDecoration(
                              labelText: 'Please enter your email'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: TextField(
                          controller: _pwd,
                          decoration: InputDecoration(
                              labelText: 'Please enter your password'),
                          obscureText: true,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: SizedBox(
                          height: 50,
                          width: 400,
                          child: RaisedButton(
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(5.0)),
                            onPressed: () {
                              if (verifyRegister(
                                  _username.text, _email.text, _pwd.text)) {
                                //api
                                print("Consumir api");
                              }
                            },
                            textColor: Colors.white,
                            child: Text(
                              'Submit',
                              style: TextStyle(fontSize: 18),
                            ),
                            color: Color.fromRGBO(38, 193, 101, 1),
                          ),
                        ),
                      ),
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

bool verifyRegister(String username, String email, String password) {
  String patterUsername = r'^[a-zA-Z0-9._]{8,30}$';
  String patternEmail =
      r'^[a-zA-Z0-9._]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9]{1,}))*$';
  String patternPwd =
      r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*._-]{8,30}$';

  RegExp regExpUsername = new RegExp(patterUsername);
  RegExp regExpEmail = new RegExp(patternEmail);

  RegExp regExpPwd = new RegExp(patternPwd);

  if (regExpUsername.hasMatch(username) &&
      regExpEmail.hasMatch(email) &&
      regExpPwd.hasMatch(password)) {
    return true;
  }
  return false;
}
