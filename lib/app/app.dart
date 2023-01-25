import 'package:flutter/material.dart';
import 'package:test_task/presentation/screens/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
