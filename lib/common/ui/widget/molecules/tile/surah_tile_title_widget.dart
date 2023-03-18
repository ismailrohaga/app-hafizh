import 'package:flutter/material.dart';
import 'package:hafizh/common/const/spacing_constant.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/ui/widget/atoms/star_badge_widget.dart';

class MoleculeSurahTileTitleWidget extends StatelessWidget {
  final String name;
  final int? number;
  final TextStyle? style;

  const MoleculeSurahTileTitleWidget(
      {super.key, required this.name, this.style, this.number = 0});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          name,
          style: style ??
              context.theme.textTheme.titleLarge?.copyWith(color: Colors.white),
        ),
        const SizedBox(
          width: SpacingConstant.small,
        ),
        AtomStarBadgeWidget(
          count: number,
        )
      ],
    );
  }
}
