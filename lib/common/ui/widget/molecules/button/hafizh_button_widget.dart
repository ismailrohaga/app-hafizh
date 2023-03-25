import 'package:flutter/material.dart';
import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';

class HafizhButtonWidget extends StatelessWidget {
  final String text;
  final Icon? leftIcon;
  final Icon? rightIcon;
  final void Function() onTap;

  const HafizhButtonWidget(
      {super.key,
      required this.text,
      required this.onTap,
      this.leftIcon,
      this.rightIcon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: context.colors.primary,
        foregroundColor: context.colors.onPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(CircularConstant.lg),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        shadowColor: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (leftIcon != null) leftIcon!,
          if (leftIcon != null) const SizedBox(width: SpacingConstant.sm),
          Text(
            text,
            style: context.textTheme.labelLarge,
          ),
          if (rightIcon != null) const SizedBox(width: SpacingConstant.sm),
          if (rightIcon != null) rightIcon!,
        ],
      ),
    );
  }
}
