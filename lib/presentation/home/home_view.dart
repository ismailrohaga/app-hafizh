import 'package:flutter/material.dart';

import 'package:hafizh/common/const/named_routes.dart';
import 'package:hafizh/common/const/screen_padding_constant.dart';

import 'package:hafizh/common/ext/build_context_ext.dart';

import 'package:hafizh/common/ui/widget/atoms/atoms.dart';
import 'package:hafizh/common/ui/widget/molecules/molecules.dart';

import 'package:hafizh/common/dependencies/dependencies.dart';

import 'package:hafizh/presentation/bloc/app_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
        listener: (context, state) {
          if (state.status == AppStatus.unauthenticated) {
            context.goNamed(NamedRoutes.loginView);
          }
        },
        child: Scaffold(
          body: CustomScrollView(slivers: [
            SliverAppBar(
              expandedHeight: 320,
              backgroundColor: context.colors.background,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 42,
                      horizontal: ScreenPaddingConstant.horizontal),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/home_hero.png"),
                          fit: BoxFit.cover)),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Hi Bayek',
                                    style: context.textTheme.headlineMedium,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const SurahWithBadgeWidget(
                                    surah: 'Al-Mulk',
                                    surahNumber: 92,
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Text(
                                    'Today’s Tahfidz. Ayah 16',
                                    style: context.textTheme.labelLarge,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const HorizontalProgressBarIndicator(
                                    count: 3,
                                    value: 2,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'Great progress! You\'ll finish memorizing al-mulk in 5 days at this rate!',
                                    style: context.textTheme.labelSmall,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            const CircularPercentageIndicatorWidget(
                              value: 0.8,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 22,
                      ),
                      Row(
                        children: const [
                          Expanded(
                            child: HafizhButtonWidget(
                              text: 'Start New Tahfidz',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: ScreenPaddingConstant.horizontal),
                  child: Column(
                    children: [
                      SurahCardWidget(
                        subtitle: "Last Read at ayah 122",
                        name: "Al-Fatiha",
                        number: 1,
                        onTap: () => {},
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: ScreenPaddingConstant.horizontal),
                  child: Column(
                    children: [
                      SurahCardWidget(
                        subtitle: "Last Read at ayah 122",
                        name: "Al-Fatiha",
                        number: 1,
                        onTap: () => {},
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ]),
        ));
  }
}
