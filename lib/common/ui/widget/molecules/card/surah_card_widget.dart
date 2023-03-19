import 'package:flutter/material.dart';
import 'package:hafizh/common/const/asset_constant.dart';
import 'package:hafizh/common/const/circular_constant.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/ui/widget/molecules/tile/surah_tile_title_widget.dart';

class MoleculeSurahCardWidget extends StatelessWidget {
  final String name;
  final int number;
  final String subtitle;
  final void Function()? onTap;

  const MoleculeSurahCardWidget(
      {super.key,
      required this.subtitle,
      required this.name,
      required this.number,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 110,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              context.colors.background.withOpacity(0.8),
              context.colors.background.withOpacity(0.8),
              context.colors.surface.withOpacity(0.8),
            ],
          ),
          borderRadius: BorderRadius.circular(CircularConstant.lg),
          image: const DecorationImage(
            image: AssetImage(AssetConstant.quranCardBgImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ListTile(
            title: MoleculeSurahTileTitleWidget(
              name: name,
              number: number,
              style: context.textTheme.titleLarge
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.w300),
            ),
            subtitle: Text(
              subtitle,
              style: context.textTheme.titleSmall
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.w300),
            ),
          ),
        ),
      ),
    );
  }
}
