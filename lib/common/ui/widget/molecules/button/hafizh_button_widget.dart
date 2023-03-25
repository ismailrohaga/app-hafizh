import 'package:flutter/material.dart';
import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';

class HafizhButtonWidget extends StatelessWidget {
  final String text;
  final Icon? leftIcon;
  final Icon? rightIcon;
  final bool disabled;
  final void Function() onTap;

  const HafizhButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
    this.disabled = false,
    this.leftIcon,
    this.rightIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (!disabled) {
          onTap();
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: disabled
            ? context.colors.primary.withOpacity(0.5)
            : context.colors.primary,
        foregroundColor: context.colors.onPrimary,
        splashFactory: disabled ? NoSplash.splashFactory : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(CircularConstant.lg),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 12.h,
          horizontal: 16.w,
        ),
        shadowColor: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (leftIcon != null) leftIcon!,
          if (leftIcon != null) SizedBox(width: SpacingConstant.sm),
          Text(
            text,
            style: context.textTheme.labelLarge,
          ),
          if (rightIcon != null) SizedBox(width: SpacingConstant.sm),
          if (rightIcon != null) rightIcon!,
        ],
      ),
    );
  }
}
