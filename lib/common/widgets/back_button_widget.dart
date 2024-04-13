import 'package:calculator_flutter_app/common/extensions/num.dart';
import 'package:calculator_flutter_app/gen/assets.gen.dart';
import 'package:calculator_flutter_app/util/resources/r.dart';
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(66.r),
              radius: 55,
              onTap: onTap ?? () => GoRouter.of(context).pop(),
              child: SizedBox(
                height: 32.r,
                width: 32.r,
                child: Assets.svgs.backIcon.svg(),
              ),
            ),
            if (title != null)
              Text(
                title!,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: color ?? R.colors.secondary,
                  fontSize: 18.sp,
                ),
              ),
            icon ?? 32.wb,
          ],
        ),
      ),
    );
  }
}
