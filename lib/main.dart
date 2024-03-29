import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:crypt/screens/wrapper.dart';
import 'package:crypt/models/user.dart';
import 'package:crypt/services/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
