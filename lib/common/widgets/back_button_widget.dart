import 'package:diesel_powered/common/extensions/num.dart';
import 'package:diesel_powered/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
    this.color,
    this.onTap,
    this.title,
    this.leftPadding,
    this.icon,
  });

  final Color? color;
  final VoidCallback? onTap;
  final String? title;
  final double? leftPadding;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 12.w, top: 8.h, right: 12.w),
        child: InkWell(
          borderRadius: BorderRadius.circular(66.r),
          radius: 55,
          onTap: onTap ?? () => GoRouter.of(context).pop(),
          child: SizedBox(
            width: 100.w,
            child: Row(
              children: [
                Icon(
                  Icons.chevron_left,
                  size: 28.r,
                  color: color ?? R.colors.primary,
                ),
                9.26.wb,
                Text(
                  'Back',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: color ?? R.colors.primary,
                    fontSize: 15.sp,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
