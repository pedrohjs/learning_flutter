import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

void main() async {
  runApp(MyApp());

  await Parse().initialize(
    '6tfUPlJrrgqbi7jPiSsUU5pj18Af0tnCxOUPAkav',
    'https://parseapi.back4app.com/',
    clientKey: 'NCQhwVzgbvel56fXLEjkCEDbpYig104B6rqgZL5c',
    autoSendSessionId: true,
    debug: true,
  );

  final category = ParseObject('Categories')
    ..set('Title', 'Camisetas')
    ..set('Position', 2);

  final response = await category.save();

  print(response.success);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Container(),
    );
  }
}
