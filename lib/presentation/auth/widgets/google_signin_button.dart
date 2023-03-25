import 'package:flutter/material.dart';
import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/provider/preference_settings_provider.dart';
import 'package:hafizh/common/ui/app_colors.dart';

class GoogleSignInButton extends StatelessWidget {
  final Function()? onPressed;
  final bool loading;
  final String text;

  const GoogleSignInButton(
      {super.key,
      this.text = 'Sign in with Google',
      this.onPressed,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    final prefsSettingProvider = context.read<PreferenceSettingsProvider>();

    return OutlinedButton(
      onPressed: () {
        if (loading) return;

        if (onPressed != null) {
          onPressed!();
        }
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: context.colors.background,
        side: const BorderSide(color: AppColors.kGrey),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(CircularConstant.lg),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 12.h,
          horizontal: 16.w,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            AssetConstant.googleIcon,
            width: 24.r,
            height: 24.r,
          ),
          SizedBox(width: SpacingConstant.sm),
          Text(
            text,
            style: context.textTheme.labelLarge?.copyWith(
              color: prefsSettingProvider.isDarkTheme
                  ? Colors.grey[300]
                  : AppColors.kDeepGreen,
            ),
          ),
          if (loading)
            SizedBox(width: SpacingConstant.sm)
          else
            const SizedBox(width: 0),
          if (loading)
            SizedBox(
              width: SpacingConstant.md,
              height: SpacingConstant.md,
              child: CircularProgressIndicator(
                strokeWidth: 2.w,
                valueColor:
                    AlwaysStoppedAnimation<Color>(context.colors.primary),
              ),
            )
          else
            const SizedBox(width: 0),
        ],
      ),
    );
  }
}
