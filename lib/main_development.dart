import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:hafizh/di/dependency_injection.dart';
import 'package:hafizh/main.dart';
import 'package:hafizh/core/credentials.dart';
import 'package:hafizh/core/firebase/firebase_options_dev.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DependencyInjection.registerDependencies(env: Environment.dev);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptionsDev.currentPlatform,
  );

  runApp(const App());
}
