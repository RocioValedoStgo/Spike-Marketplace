import 'package:flutter/material.dart';
import 'package:pageview_app/src/services/AuthService.dart';

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
                              AuthService authS = new AuthService();
                              Map<String, dynamic> request = {
                                "username": _username.text,
                                "email": _email.text,
                                "password": _pwd.text,
                              };
                              authS.register(context, params: request);
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
