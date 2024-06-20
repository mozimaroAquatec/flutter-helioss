import 'package:flutter/material.dart';
import 'package:helioss/pages/energies/energies.dart';
import 'package:helioss/pages/filtration/filtrations.dart';
import 'package:helioss/pages/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: MaterialApp(home: Home(), routes: {
      "home": (context) => Home(),
      "energies": (context) => Energies(),
      "filtrations": (context) => Filtrations()
    }));
  }
}
