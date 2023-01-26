import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_task/presentation/provider/user_provider.dart';

import 'package:test_task/presentation/screens/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: Home(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
