import 'package:flutter/material.dart';
import 'package:hafizh/common/const/spacing_constant.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/ui/widget/atoms/star_badge_widget.dart';

class SurahTileTitleWidget extends StatelessWidget {
  final String name;
  final int? number;
  final TextStyle? style;

  const SurahTileTitleWidget(
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
        SizedBox(
          width: SpacingConstant.sm,
        ),
        StarBadgeWidget(
          count: number,
        )
      ],
    );
  }
}
