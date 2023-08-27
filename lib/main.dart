import 'package:flutter/material.dart';
import 'package:flutter_first_app/app_screens/login.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (context) => MyLogin(),
      },
    ),
  );
}
