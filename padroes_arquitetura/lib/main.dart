import 'package:flutter/material.dart';
import 'package:padroes_arquitetura/archs/mvc/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPageMVC(),
    );
  }
}
