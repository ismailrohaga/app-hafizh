import 'package:flutter/material.dart';
import 'package:hafizh/presentation/bloc/app_bloc.dart';
import 'package:provider/provider.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.read<AppBloc>().state;

    print(user.toString());

    return const Scaffold(
      body: Center(child: Text("Settings View")),
    );
  }
}
