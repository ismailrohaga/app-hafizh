import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hafizh/common/const/const.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/provider/preference_settings_provider.dart';
import 'package:hafizh/common/ui/app_colors.dart';

class ScaffoldLoginViewWrapperWidget extends StatelessWidget {
  final Widget child;

  const ScaffoldLoginViewWrapperWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    var prefsSettingsProvider = context.read<PreferenceSettingsProvider>();

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: prefsSettingsProvider.isDarkTheme
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        child: Scaffold(
            body: SafeArea(
                child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: ScreenPaddingConstant.vertical,
                      horizontal: ScreenPaddingConstant.horizontal,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        child,
                        RichText(
                          text: TextSpan(
                            text: "Don't have an account? ",
                            style: context.textTheme.labelMedium?.copyWith(
                              color: prefsSettingsProvider.isDarkTheme
                                  ? Colors.grey[300]
                                  : Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: "Sign Up",
                                style: context.textTheme.labelMedium?.copyWith(
                                  color: prefsSettingsProvider.isDarkTheme
                                      ? Colors.blue
                                      : AppColors.kNormalBlue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )))));
  }
}
