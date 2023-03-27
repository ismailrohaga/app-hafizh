import 'package:flutter/material.dart';
import 'package:hafizh/common/const/circular_constant.dart';
import 'package:hafizh/common/const/spacing_constant.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';

class HorizontalProgressBarIndicator extends StatelessWidget {
  final int count;
  final int value;

  const HorizontalProgressBarIndicator(
      {super.key, required this.count, required this.value});

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];

    for (var i = 0; i < count; i++) {
      children.add(buildProgressIndicator(context, i < value));
    }

    return Row(
      children: children,
    );
  }

  Widget buildProgressIndicator(BuildContext context, bool isCompleted) {
    return Expanded(
      flex: 1,
      child: Container(
          height: SpacingConstant.sm,
          margin: EdgeInsets.only(right: SpacingConstant.sm),
          decoration: BoxDecoration(
            color: isCompleted
                ? context.colors.secondary
                : context.colors.tertiary,
            borderRadius:
                const BorderRadius.all(Radius.circular(CircularConstant.md)),
          )),
    );
  }
}
