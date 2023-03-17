import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hafizh/app.dart';
import 'package:hafizh/core/credentials.dart';
import 'package:hafizh/core/di/dependency_injection.dart';
import 'package:hafizh/core/firebase/firebase_options_prod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  DependencyInjection.registerDependencies(env: Environment.prod);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptionsProd.currentPlatform,
  );

  runApp(const App());
}
