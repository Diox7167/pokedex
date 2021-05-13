import 'package:flutter/material.dart';
import 'package:pokedex/stores/userStore.dart';
import 'package:pokedex/stores/pokedexStore.dart';
import 'package:pokedex/ui/views/splashScreen.dart';

final user = UserStore();
final pokedex = PokedexStore();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokédex',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SplashScreen(),
    );
  }
}
