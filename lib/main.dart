import 'package:flutter/material.dart';
import 'package:test_task/app/app.dart';
import 'package:test_task/app/locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MyApp());
}
