import 'package:diesel_powered/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OTPField extends StatelessWidget {
  const OTPField({
    required this.node,
    required this.index,
    required this.controller,
    Key? key,
    this.onChanged,
  }) : super(key: key);

  final int index;
  final FocusNode node;
  final void Function(String, int)? onChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 70.w,
      padding: EdgeInsets.only(right: 14.r),
      child: AspectRatio(
        aspectRatio: 1.55.w,
        child: TextFormField(
          autofocus: true,
          focusNode: node,
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              return '';
            }
            return null;
          },
          onChanged: (value) {
            if (onChanged != null) {
              onChanged!(value, index);
            }
          },
          showCursor: false,
          enableInteractiveSelection: false,
          style: TextStyle(
            fontSize: 16.sp,
            color: R.colors.primary,
          ),
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(
              RegExp('^[0-9]'),
            )
          ],
          maxLength: 1,
          decoration: InputDecoration(
            focusColor: R.colors.primary,
            counter: const Offstage(),
            border: const UnderlineInputBorder(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: R.colors.greyTextField),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: R.colors.primary,
                width: 1.2.w,
              ),
            ),
            hintText: '0',
          ),
        ),
      ),
    );
  }
}
