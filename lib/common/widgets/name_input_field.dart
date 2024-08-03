import 'package:diesel_powered/common/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class NameInputField extends StatelessWidget {
  const NameInputField({
    required this.onChanged,
    required this.hintText,
    this.labelText,
    this.controller,
    this.validator,
    this.suffixIcon,
    this.width,
    this.shadowColor,
    this.focusNode,
    this.onEditingComplete,
    this.onTap,
    this.enabled = true,
    super.key,
  });

  final void Function(String?)? onChanged;
  final String? labelText;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final double? width;
  final Color? shadowColor;
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;
  final VoidCallback? onTap;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: labelText,
      hintText: hintText,
      controller: controller,
      focusNode: focusNode,
      keyboardType: TextInputType.name,
      onEditingComplete: onEditingComplete,
      onTap: onTap,
      enabled: enabled,
      validator: validator ??
          (value) {
            final RegExp nameRegExp = RegExp(r'^[a-zA-Z\- ]+$');

            if (value?.isEmpty ?? true) {
              return 'Please enter your name';
            }
            if (value!.length > 50) {
              return 'Name cannot be more than 50 characters';
            }
            if (!nameRegExp.hasMatch(value)) {
              return 'Name can only contain letters, spaces and dashes';
            }
            if (value.contains(RegExp(r'\s{2,}'))) {
              return 'Please enter one space at a time';
            }

            return null;
          },
      onChanged: onChanged,
      suffixIcon: suffixIcon,
    );
  }
}
