import 'dart:async';

import 'package:diesel_powered/features/auth/presentation/providers/otp_form_provider/otp_form_provider.dart';
import 'package:diesel_powered/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class OtpWidget extends ConsumerStatefulWidget {
  const OtpWidget({
    required this.onChanged,
    super.key,
  });

  final void Function(String)? onChanged;

  @override
  ConsumerState createState() => _OtpWidgetState();
}

class _OtpWidgetState extends ConsumerState<OtpWidget> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() {
      focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(otpFormNotifierProvider);

    final defaultPinTheme = PinTheme(
      width: 71.w,
      height: 56.h,
      textStyle: TextStyle(
        fontSize: 40.sp,
        fontWeight: FontWeight.w500,
        color: R.colors.black,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: R.colors.black),
        ),
      ),
    );

    /// [otp widget]
    return Column(
      children: [
        Pinput(
          controller: pinController,
          focusNode: focusNode,
          defaultPinTheme: defaultPinTheme,
          separatorBuilder: (index) => SizedBox(width: 12.w),
          onClipboardFound: (value) {
            pinController.setText(value);
          },
          hapticFeedbackType: HapticFeedbackType.lightImpact,
          onChanged: widget.onChanged,
          cursor: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 16.h),
                width: 2.w,
                height: 22.h,
                color: R.colors.greyTextField,
              ),
            ],
          ),
          focusedPinTheme: defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration,
          ),
          submittedPinTheme: defaultPinTheme.copyWith(
            decoration: defaultPinTheme.decoration,
          ),
          errorPinTheme: defaultPinTheme.copyBorderWith(
            border: Border.all(color: Colors.redAccent),
          ),
        ),
      ],
    );
  }
}
