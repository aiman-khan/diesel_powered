import 'package:calculator_flutter_app/common/widgets/custom_text_form_field.dart';
import 'package:calculator_flutter_app/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationInputField extends StatelessWidget {
  const LocationInputField({
    required this.onChanged,
    this.hintText,
    this.labelText,
    this.controller,
    this.validator,
    this.suffixIcon,
    this.width,
    this.shadowColor,
    this.focusNode,
    this.onEditingComplete,
    this.onTap,
    super.key,
  });

  final void Function(String?)? onChanged;
  final String? labelText;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final double? width;
  final Color? shadowColor;
  final FocusNode? focusNode;
  final void Function()? onEditingComplete;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      width: double.infinity,
      labelText: labelText,
      hintText: hintText ?? 'Enter your location here',
      controller: controller,
      focusNode: focusNode,
      keyboardType: TextInputType.name,
      onEditingComplete: onEditingComplete,
      onTap: onTap,
      validator: validator ??
          (value) {
            if (value?.isEmpty ?? true) {
              return 'Please enter your location';
            }

            return null;
          },
      onChanged: onChanged,
      suffixIcon: Padding(
        padding: EdgeInsets.only(right: 7.w),
        child: suffixIcon ??
            Icon(
              Icons.my_location_rounded,
              color: R.colors.primary,
            ),
      ),
    );
  }
}
