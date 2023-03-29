import 'package:flutter/material.dart';
import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';

class HafizhButtonWidget extends StatelessWidget {
  final String text;
  final Icon? leftIcon;
  final Icon? rightIcon;
  final bool disabled;
  final bool loading;
  final void Function() onTap;

  const HafizhButtonWidget({
    super.key,
    required this.text,
    required this.onTap,
    this.disabled = false,
    this.loading = false,
    this.leftIcon,
    this.rightIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (disabled || loading) return;
        onTap();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: disabled || loading
            ? context.colors.primary.withOpacity(0.5)
            : context.colors.primary,
        foregroundColor: context.colors.onPrimary,
        splashFactory: disabled ? NoSplash.splashFactory : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(CircularConstant.lg),
        ),
        maximumSize: Size.fromHeight(48.h),
        minimumSize: Size.fromHeight(48.h),
        padding: EdgeInsets.symmetric(
          vertical: 14.5.h,
        ),
        shadowColor: Colors.transparent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (leftIcon != null) leftIcon!,
          if (leftIcon != null) SizedBox(width: 8.w),
          Text(text, style: context.textTheme.labelLarge),
          if (rightIcon != null) SizedBox(width: 8.w),
          if (rightIcon != null) rightIcon!,
          if (loading) SizedBox(width: 8.w),
          if (loading)
            SizedBox(
              width: 16.w,
              height: 16.w,
              child: CircularProgressIndicator(
                strokeWidth: 2.w,
                valueColor: AlwaysStoppedAnimation<Color>(
                  context.colors.surface,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
