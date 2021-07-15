import 'package:flutter/material.dart';
import 'package:pokedex/src/screens/home/home_screen.dart';

class PokemonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedéx',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.red,
      ),
      home: HomeScreen(),
    );
  }
}
