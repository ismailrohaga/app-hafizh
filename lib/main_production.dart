import 'package:flutter/material.dart';
import 'package:hafizh/app/app.dart';
import 'package:hafizh/core/credentials.dart';
import 'package:hafizh/core/di/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  DependencyInjection.registerDependencies(env: Environment.prod);

  runApp(const App());
}
