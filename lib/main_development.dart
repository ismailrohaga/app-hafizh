import 'package:flutter/material.dart';
import 'package:hafizh/app.dart';
import 'package:hafizh/core/credentials.dart';
import 'package:hafizh/core/di/dependency_injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  DependencyInjection.registerDependencies(env: Environment.dev);

  runApp(const App());
}
