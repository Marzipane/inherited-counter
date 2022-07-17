import 'package:flutter/material.dart';
import 'route_generator.dart';

void main() {
  runApp(MaterialApp(
    title: "Inherited Widget",
    theme: ThemeData(
      primarySwatch: Colors.purple,
    ).copyWith(primaryColor: Colors.purple[400]),
    home: const RouteGenerator(),
  ));
}
