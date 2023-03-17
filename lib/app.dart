import 'package:flutter/material.dart';
import 'package:hafizh/common/ui/app_theme.dart';
import 'package:hafizh/core/router/app_router.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  AppTheme get theme => AppTheme();

  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.
    return MultiProvider(
      providers: [
        Provider(create: (context) => String),
      ],
      child: MaterialApp.router(
        theme: theme.lightTheme,
        darkTheme: theme.darkTheme,
        themeMode: ThemeMode.light,
        routerConfig: appRouter,
      ),
    );
  }
}
