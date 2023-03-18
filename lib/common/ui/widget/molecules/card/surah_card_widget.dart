import 'package:flutter/material.dart';
import 'package:hafizh/common/const/asset_constant.dart';
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
      child: Card(
        child: Container(
          height: 110,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [Color(0xFF012C3B), Color(0xFFD9D9D9)],
            ),
            borderRadius: BorderRadius.circular(8.0),
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
                style: context.theme.textTheme.titleLarge?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w300),
              ),
              subtitle: Text(
                subtitle,
                style: context.theme.textTheme.titleSmall?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w300),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
