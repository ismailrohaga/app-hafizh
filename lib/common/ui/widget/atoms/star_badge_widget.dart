import 'package:flutter/material.dart';
import 'package:hafizh/common/const/asset_constant.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';

class AtomStarBadgeWidget extends StatelessWidget {
  final int? count;

  const AtomStarBadgeWidget({super.key, this.count = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetConstant.starIcon),
        ),
      ),
      child: Center(
        child: Text(
          count.toString(),
          style: context.theme.textTheme.titleSmall,
        ),
      ),
    );
  }
}
