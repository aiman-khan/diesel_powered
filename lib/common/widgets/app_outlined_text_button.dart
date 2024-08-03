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
        backgroundColor: MaterialStateProperty.all(R.colors.white),
        side: MaterialStateProperty.all(
          BorderSide(
            color: color ?? R.colors.primary,
          ),
        ),
        minimumSize: MaterialStateProperty.all(
          Size(width?.w ?? 293.w, height?.w ?? 45.h),
        ),
        maximumSize: MaterialStateProperty.all(
          Size(width?.w ?? 293.w, height?.w ?? 45.h),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
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
