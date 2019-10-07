import 'package:flutter/material.dart';
import 'ui/favoritesCity.dart';
import 'ui/siForm.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: SIForm() /*FavoriteCity()*/,
    );
  }
}



