import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hafizh/common/const/named_routes.dart';

import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/presentation/bloc/app_bloc.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.select((AppBloc bloc) => bloc);
    final user = bloc.state.user;

    return BlocListener<AppBloc, AppState>(
      bloc: bloc,
      listener: (context, state) {
        if (state.status == AppStatus.unauthenticated) {
          context.goNamed(NamedRoutes.loginView);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: context.colors.background,
          title: Text(
            "Settings",
            style: context.textTheme.titleMedium,
          ),
          actions: [
            IconButton(
              tooltip: "Logout",
              onPressed: () =>
                  context.read<AppBloc>().add(const AppLogoutRequested()),
              icon: Icon(
                Icons.logout,
                color: context.colors.surface,
              ),
            ),
          ],
        ),
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(user.photo.toString()),
                ),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              user.name.toString(),
              style:
                  context.textTheme.titleMedium?.copyWith(color: Colors.black),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              user.email.toString(),
              style: context.textTheme.titleSmall?.copyWith(color: Colors.grey),
            ),
          ],
        )),
      ),
    );
  }
}
