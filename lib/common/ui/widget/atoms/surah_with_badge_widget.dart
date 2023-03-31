import 'package:flutter/material.dart';
import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/ui/widget/atoms/atoms.dart';

class SurahWithBadgeWidget extends StatelessWidget {
  const SurahWithBadgeWidget({
    Key? key,
    required this.surah,
    required this.surahNumber,
  }) : super(key: key);

  final String surah;
  final int? surahNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(surah, style: context.textTheme.titleLarge),
        SizedBox(
          width: SpacingConstant.sm,
        ),
        StarBadgeWidget(
          count: surahNumber,
        ),
      ],
    );
  }
}
