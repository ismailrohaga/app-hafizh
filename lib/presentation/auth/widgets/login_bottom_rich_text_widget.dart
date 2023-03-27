import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/provider/preference_settings_provider.dart';
import 'package:hafizh/common/ui/app_colors.dart';

class LoginBottomRichTextWidget extends StatelessWidget {
  const LoginBottomRichTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<PreferenceSettingsProvider>(
        builder: (context, preference, __) {
      return RichText(
        text: TextSpan(
          text: "Don't have an account? ",
          style: context.textTheme.labelMedium?.copyWith(
            color: preference.isDarkTheme ? Colors.grey[300] : Colors.black,
          ),
          children: [
            TextSpan(
              text: "Sign Up",
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.goNamed(NamedRoutes.registerView);
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
