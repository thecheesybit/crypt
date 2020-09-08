import 'package:flutter/material.dart';
import 'package:crypt/shared/constants.dart';
import 'package:crypt/shared/loading.dart';
import 'package:crypt/services/auth.dart';


class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: Text(
                '',
                style: TextStyle(color: Colors.black),
              ),
            ),
            extendBodyBehindAppBar: true,
            body: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/b3.gif"),
                    fit: BoxFit.cover),
              ),
              child: Column(
                children: <Widget>[
                  Center(
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                        child: Container(
                          child: Image.asset("assets/images/logo.png"),
                        ),
                      ),
                    ),
                  ), 
                  SizedBox(
              height: 10,
            ),
            Text('WELCOME TO CRYPT'),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          //SizedBox(height: 10.0),
                          TextFormField(
                            decoration:
                                textInputDecoration.copyWith(hintText: 'email'),
                            validator: (val) =>
                                val.isEmpty ? 'Enter an email' : null,
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                          ),
                          SizedBox(height: 20.0),
                          TextFormField(
                            decoration: textInputDecoration.copyWith(
                                hintText: 'password'),
                            obscureText: true,
                            validator: (val) => val.length < 6
                                ? 'Enter a password 6+ chars long'
                                : null,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                          ),
                          SizedBox(height: 20.0),
                          RaisedButton(
                              color: Colors.pink[400],
                              child: Text(
                                'Register',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() => loading = true);
                                  dynamic result =
                                      await _auth.registerWithEmailAndPassword(
                                          email, password);
                                  if (result == null) {
                                    setState(() {
                                      loading = false;
                                      error = 'Please supply a valid email';
                                    });
                                  }
                                }
                              }),
                          SizedBox(height: 12.0),
                          Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: 14.0),
                          ),
                          FlatButton(
                             child: Text('Already a User ? Sign In'),
                             //elevation: 0,
                             color: Colors.transparent,
                             onPressed: () => widget.toggleView(),),
                        ],
                      
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
