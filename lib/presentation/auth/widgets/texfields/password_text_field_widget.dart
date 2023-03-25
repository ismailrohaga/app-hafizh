import 'package:flutter/material.dart';
import 'package:hafizh/common/dependencies/dependencies.dart';
import 'package:hafizh/common/ext/build_context_ext.dart';
import 'package:hafizh/common/provider/preference_settings_provider.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  const PasswordTextFieldWidget({super.key});

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
      builder: (context, preference, __) => TextField(
        obscureText: _isObscure,
        style: context.textTheme.bodyLarge?.copyWith(
          color: preference.isDarkTheme ? Colors.grey[300] : Colors.black,
        ),
        decoration: InputDecoration(
          labelText: 'Password',
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
