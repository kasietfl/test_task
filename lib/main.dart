import 'package:flutter/material.dart';
import 'package:test_task/app/app.dart';
import 'package:test_task/app/locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.setup();
  runApp(const MyApp());
}
