import 'package:flutter/material.dart';
import 'package:hafizh/common/const/asset_constant.dart';
import 'package:hafizh/common/const/circular_constant.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/ui/widget/molecules/molecules.dart';

class SurahCardWidget extends StatelessWidget {
  final String name;
  final int number;
  final String subtitle;
  final void Function()? onTap;

  const SurahCardWidget(
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
            title: SurahTileTitleWidget(
              name: name,
              number: number,
              style: context.textTheme.titleLarge
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.w300),
            ),
            subtitle: Text(
              subtitle,
              style: context.textTheme.bodyLarge?.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
