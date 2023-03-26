import 'package:flutter/material.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/provider/preference_settings_provider.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String? errorText;
  final void Function(String value)? onChanged;
  final String? Function(String?)? validator;

  final String? initialValue;

  const PasswordTextFieldWidget(
      {super.key,
      required this.controller,
      required this.labelText,
      this.errorText,
      this.onChanged,
      this.validator,
      this.initialValue});

  @override
  State<PasswordTextFieldWidget> createState() =>
      _PasswordTextFieldStateWidget();
}

class _PasswordTextFieldStateWidget extends State<PasswordTextFieldWidget> {
  bool _isObscure = true;

  void setObscure(bool value) {
    setState(() {
      _isObscure = value;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PreferenceSettingsProvider>(
      builder: (context, preference, __) => TextFormField(
        controller: widget.controller,
        initialValue: widget.initialValue,
        obscureText: _isObscure,
        validator: widget.validator,
        onChanged: widget.onChanged,
        style: context.textTheme.bodyLarge?.copyWith(
          color: preference.isDarkTheme ? Colors.grey[300] : Colors.black,
        ),
        decoration: InputDecoration(
          labelText: widget.labelText,
          errorText: widget.errorText,
          suffixIcon: SizedBox(
            width: 22.w,
            height: 15.h,
            child: IconButton(
                splashRadius: 16.w,
                onPressed: () => setObscure(!_isObscure),
                icon:
                    Icon(_isObscure ? Icons.visibility : Icons.visibility_off)),
          ),
        ),
      ),
    );
  }
}
