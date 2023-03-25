import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/provider/provider.dart';
import 'package:hafizh/common/ui/app_colors.dart';

class TermOfServicePrivacyPolicyWidget extends StatelessWidget {
  const TermOfServicePrivacyPolicyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final prefsSettingsProvider = context.read<PreferenceSettingsProvider>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 52),
      child: Text.rich(
        style: context.textTheme.bodyMedium?.copyWith(
          fontSize: 14.sp,
          color: prefsSettingsProvider.isDarkTheme
              ? Colors.grey[300]
              : AppColors.kDeepGreen,
        ),
        TextSpan(
          text: 'By signing up you are agreeing to our ',
          children: [
            TextSpan(
              text: 'Terms of Service',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // TODO: implement onTap for Terms of Service
                },
              style: context.textTheme.bodyMedium?.copyWith(
                color: prefsSettingsProvider.isDarkTheme
                    ? Colors.blueAccent
                    : AppColors.kNormalBlue,
              ),
            ),
            const TextSpan(
              text: ' and ',
            ),
            TextSpan(
              text: 'Privacy Policy',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // TODO: implement onTap for Privacy Policy
                },
              style: context.textTheme.bodyMedium?.copyWith(
                color: prefsSettingsProvider.isDarkTheme
                    ? Colors.blueAccent
                    : AppColors.kNormalBlue,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
