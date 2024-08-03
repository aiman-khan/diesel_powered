import 'dart:io';

import 'package:diesel_powered/common/extensions/num.dart';
import 'package:diesel_powered/common/widgets/phone_input/countries.dart';
import 'package:diesel_powered/common/widgets/phone_input/country_picker_dialog.dart';
import 'package:diesel_powered/common/widgets/phone_input/intl_phone_field.dart';
import 'package:diesel_powered/common/widgets/phone_input/phone_number.dart';
import 'package:diesel_powered/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneNumberInputField extends ConsumerWidget {
  const PhoneNumberInputField({
    required this.onChanged,
    this.onCountryChanged,
    this.isNotEmpty = true,
    this.focusNode,
    this.onEditingComplete,
    this.controller,
    this.initialCountryCode,
    super.key,
  });

  final void Function(PhoneNumber) onChanged;
  final void Function(Country)? onCountryChanged;
  final bool isNotEmpty;
  final FocusNode? focusNode;
  final void Function(String)? onEditingComplete;
  final TextEditingController? controller;
  final String? initialCountryCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phone number',
          style: TextStyle(
            fontSize: 15.sp,
            color: R.colors.black,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.10.w,
          ),
        ),
        4.95.hb,
        AppPhoneField(
          isModalSheet: true,
          iconColor: R.colors.primary,
          title: 'Phone number',
          titleStyle: TextStyle(
            fontSize: 25.sp,
            color: R.colors.black,
            fontWeight: FontWeight.w600,
            fontFamily: 'Urbanist',
          ),
          cursorColor: R.colors.greyTextField,
          cursorHeight: 20.sp,
          dropdownIconPosition: IconPosition.trailing,
          pickerDialogStyle: PickerDialogStyle(
            searchFieldInputDecoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: R.colors.orange,
              ),
              hintText: 'Type a country',
              hintStyle: TextStyle(
                fontSize: 15.sp,
                color: R.colors.orange,
                fontWeight: FontWeight.w500,
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 12.h,
                horizontal: 16.w,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: R.colors.greyTextField),
                borderRadius: BorderRadius.circular(10.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: R.colors.greyTextField),
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
          keyboardType: Platform.isIOS
              ? const TextInputType.numberWithOptions(
                  signed: true,
                )
              : TextInputType.phone,
          inputFormatters: (Platform.isIOS)
              ? [
                  FilteringTextInputFormatter.digitsOnly,
                ]
              : null,
          textInputAction: TextInputAction.next,
          onSubmitted: onEditingComplete,
          controller: controller,
          focusNode: focusNode,
          onCountryChanged: onCountryChanged,
          validator: (v) {
            if (v?.number.isEmpty ?? false) {
              return 'Please enter your phone number';
            }
            if (!v!.isValidNumber()) {
              return 'Invalid number';
            }
            return null;
          },
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: 12.h,
              horizontal: 16.w,
            ),
            border: InputBorder.none,
            counterText: "",
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: R.colors.greyTextField),
              borderRadius: BorderRadius.circular(10.r),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: R.colors.primary),
              borderRadius: BorderRadius.circular(10.r),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: R.colors.warningRed),
              borderRadius: BorderRadius.circular(10.r),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: R.colors.warningRed),
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          initialCountryCode: initialCountryCode ?? 'DE',
          flagsButtonPadding: EdgeInsets.only(bottom: 2.75.h),
          dropdownIcon: Icon(
            Icons.keyboard_arrow_down,
            color: R.colors.black,
          ),
          dropdownTextStyle: TextStyle(
            fontSize: 15.sp,
            color: R.colors.black,
            fontWeight: FontWeight.w500,
          ),
          style: TextStyle(
            fontSize: 16.sp,
            color: R.colors.black,
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
