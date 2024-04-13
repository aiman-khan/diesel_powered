import 'package:calculator_flutter_app/common/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class EmailInputField extends StatelessWidget {
  const EmailInputField({
    required this.onChanged,
    required this.hintText,
    this.labelText,
    this.controller,
    this.validator,
    this.suffixIcon,
    this.focusNode,
    this.onEditingComplete,
    this.autofocus,
    super.key,
  });

  final void Function(String?)? onChanged;
  final String? labelText;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;
  final bool? autofocus;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: labelText,
      hintText: hintText,
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      validator: validator ??
          (v) {
            if (v?.isEmpty ?? false) {
              return 'Enter an email';
            }

            if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(v!)) {
              return 'Enter a valid email';
            }

            return null;
          },
      onChanged: onChanged,
      suffixIcon: suffixIcon,
      focusNode: focusNode,
      onEditingComplete: onEditingComplete,
      autofocus: autofocus ?? false,
    );
  }
}
