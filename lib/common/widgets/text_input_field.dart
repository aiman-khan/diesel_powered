import 'package:diesel_powered/common/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    required this.onChanged,
    required this.hintText,
    this.labelText,
    this.controller,
    this.validator,
    this.suffixIcon,
    this.focusNode,
    this.onEditingComplete,
    this.autofocus,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.radius,
    this.color,
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
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final double? radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      radius: radius ?? 47.r,
      labelText: labelText,
      hintText: hintText,
      controller: controller,
      keyboardType: TextInputType.text,
      validator: validator ??
          (v) {
            if (v?.isEmpty ?? true) {
              return '$hintText is required';
            }
            return null;
          },
      onChanged: onChanged,
      suffixIcon: suffixIcon,
      focusNode: focusNode,
      onEditingComplete: onEditingComplete,
      autofocus: autofocus ?? false,
      minLine: minLines ?? 1,
      maxLines: maxLines ?? 1,
      maxLength: maxLength,
      fillColor: color,
    );
  }
}
