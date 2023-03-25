import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/provider/preference_settings_provider.dart';
import 'package:hafizh/common/ui/app_colors.dart';

class RegisterBottomRichTextWidget extends StatelessWidget {
  const RegisterBottomRichTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<PreferenceSettingsProvider>(
        builder: (context, preference, __) {
      return RichText(
        text: TextSpan(
          text: "Already have an account? ",
          style: context.textTheme.labelMedium?.copyWith(
            color: preference.isDarkTheme ? Colors.grey[300] : Colors.black,
          ),
          children: [
            TextSpan(
              text: "Sign In",
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.goNamed(NamedRoutes.loginView);
                },
              style: context.textTheme.labelMedium?.copyWith(
                color: preference.isDarkTheme
                    ? Colors.blue
                    : AppColors.kNormalBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    });
  }
}
