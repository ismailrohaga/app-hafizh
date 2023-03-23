import 'package:flutter/material.dart';
import 'package:hafizh/common/const/circular_constant.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';

class HafizhButtonWidget extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const HafizhButtonWidget({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: context.colors.primary,
            borderRadius:
                const BorderRadius.all(Radius.circular(CircularConstant.lg))),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            text,
            style: context.textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
