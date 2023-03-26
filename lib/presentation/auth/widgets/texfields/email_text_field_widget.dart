import 'package:flutter/material.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/provider/preference_settings_provider.dart';

class EmailTextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final void Function(String value)? onChanged;
  final String? errorText;
  final String? Function(String? value)? validator;
  final TextInputAction? textInputAction;

  const EmailTextFieldWidget({
    super.key,
    this.controller,
    this.onChanged,
    this.errorText,
    this.validator,
    this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<PreferenceSettingsProvider>(
      builder: (context, preference, widget) => TextFormField(
        textInputAction: textInputAction,
        controller: controller,
        onChanged: onChanged,
        validator: validator,
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
