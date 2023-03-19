import 'package:flutter/material.dart';
import 'package:hafizh/common/const/circular_constant.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';

class HafizhButtonWidget extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const HafizhButtonWidget({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(CircularConstant.lg),
        ),
      ),
      child: Text(
        text,
        style: context.textTheme.titleMedium,
      ),
    );
  }
}
