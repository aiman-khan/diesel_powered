import 'package:diesel_powered/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppOutlinedTextButton extends StatelessWidget {
  const AppOutlinedTextButton({
    required this.text,
    required this.onTap,
    super.key,
    this.width,
    this.height,
    this.color,
  });

  final String text;
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(R.colors.white),
        side: WidgetStateProperty.all(
          BorderSide(
            color: color ?? R.colors.primary,
          ),
        ),
        minimumSize: WidgetStateProperty.all(
          Size(width?.w ?? 293.w, height?.w ?? 50.h),
        ),
        maximumSize: WidgetStateProperty.all(
          Size(width?.w ?? 293.w, height?.w ?? 50.h),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.r),
          ),
        ),
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(
          color: color ?? R.colors.primary,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
