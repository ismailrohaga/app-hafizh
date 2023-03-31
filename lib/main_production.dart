import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hafizh/main.dart';
import 'package:hafizh/core/credentials.dart';
import 'package:hafizh/core/firebase/firebase_options_prod.dart';
import 'package:hafizh/di/dependency_injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptionsProd.currentPlatform,
  );

  DependencyInjection.registerDependencies(env: Environment.prod);

  runApp(const Main());
}
