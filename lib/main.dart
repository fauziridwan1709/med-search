import 'package:flutter/material.dart';
import 'package:medsearch/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: goRouter,
      title: 'med search',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
