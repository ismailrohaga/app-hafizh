import 'package:flutter/material.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/provider/preference_settings_provider.dart';

class EmailTextFieldWidget extends StatelessWidget {
  final void Function(String value)? onChanged;
  final String? errorText;

  const EmailTextFieldWidget({
    super.key,
    this.onChanged,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<PreferenceSettingsProvider>(
      builder: (context, preference, widget) => TextField(
        onChanged: onChanged,
        style: context.textTheme.bodyLarge?.copyWith(
          color: preference.isDarkTheme ? Colors.grey[300] : Colors.black,
        ),
        decoration: InputDecoration(
          labelText: 'Email',
          errorText: errorText,
        ),
      ),
    );
  }
}
