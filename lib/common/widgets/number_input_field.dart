import 'package:diesel_powered/common/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class NumberInputField extends StatelessWidget {
  const NumberInputField({
    required this.onChanged,
    required this.name,
    this.controller,
    this.validator,
    this.autofocus,
    this.focusNode,
    this.onEditingComplete,
    this.hintText,
    this.labelText,
    this.shadowColor,
    this.enabled = true,
    this.fillColor,
    this.suffixIcon,
    super.key,
  });

  final String name;
  final void Function(String?)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? autofocus;
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;
  final String? hintText;
  final String? labelText;
  final Color? shadowColor;
  final bool enabled;
  final Color? fillColor;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: labelText,
      hintText: hintText ?? '',
      controller: controller,
      enabled: enabled,
      keyboardType: TextInputType.number,
      validator: validator ??
          (v) {
            if (v?.isEmpty ?? false) {
              return '$name is required';
            }
            return null;
          },
      onChanged: onChanged,
      autofocus: autofocus ?? false,
      focusNode: focusNode,
      onEditingComplete: onEditingComplete,
      fillColor: fillColor,
      suffixIcon: suffixIcon,
    );
  }
}
