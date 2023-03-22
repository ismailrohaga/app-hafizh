import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hafizh/common/provider/preference_settings_provider.dart';
import 'package:hafizh/common/ui/widget/molecules/button/hafizh_button_widget.dart';
import 'package:hafizh/common/const/named_routes.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';

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
      child: Consumer<PreferenceSettingsProvider>(
          builder: (context, prefSetProvider, _) {
        return Scaffold(
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
              ProfilePicWidget(
                photoUrl: user.photo ?? '',
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                user.name.toString(),
                style: context.textTheme.titleMedium
                    ?.copyWith(color: Colors.black),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                user.email.toString(),
                style:
                    context.textTheme.titleSmall?.copyWith(color: Colors.grey),
              ),
              HafizhButtonWidget(
                onTap: () => prefSetProvider
                    .enableDarkTheme(!prefSetProvider.isDarkTheme),
                text: 'Hit me!',
              ),
            ],
          )),
        );
      }),
    );
  }
}

class ProfilePicWidget extends StatelessWidget {
  final String photoUrl;

  const ProfilePicWidget({super.key, required this.photoUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: photoUrl,
      height: 80,
      width: 80,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white,
              ))),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
