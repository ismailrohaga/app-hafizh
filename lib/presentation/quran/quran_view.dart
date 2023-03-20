import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hafizh/common/const/named_routes.dart';
import 'package:hafizh/common/const/screen_padding_constant.dart';
import 'package:hafizh/common/ui/widget/molecules/card/surah_card_widget.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: ScreenPaddingConstant.horizontal),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 114,
            itemBuilder: (context, index) => MoleculeSurahCardWidget(
              subtitle: "Last Read at ayah ${index + 1}",
              name: "Al-Fatiha",
              number: index + 1,
              onTap: () => context.goNamed(NamedRoutes.detailSurahView),
            ),
          ),
        ),
      ),
    );
  }
}
