import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hafizh/common/const/named_routes.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 80.0),
        child: Center(
          child: Column(
            children: [
              const Text('Splash Screen'),
              ElevatedButton(
                onPressed: () {
                  context.go(NamedRoutes.homeView);
                },
                child: const Text('Gotomain',
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
