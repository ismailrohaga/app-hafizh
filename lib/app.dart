import 'package:flutter/material.dart';
import 'package:hafizh/core/router/router.dart';
import 'package:hafizh/domain/model/catalog.dart';
import 'package:hafizh/ui/theme/theme.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  AppTheme get theme => AppTheme();

  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.
    return MultiProvider(
      providers: [
        //TODO: remove this
        Provider(create: (context) => CatalogModel()),
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
