import 'package:flutter/material.dart';

class AppSettings {
  ThemeData theme() {
    return ThemeData(
        primarySwatch: Colors.indigo,
        splashColor: Colors.indigo,
        appBarTheme: AppBarTheme(
          color: Colors.indigo,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        cardTheme: CardTheme(
            color: Colors.white,
            elevation: 3,
            shadowColor: Colors.black54,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8))));
  }
}
