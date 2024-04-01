import 'package:calculator_flutter_app/common/extensions/num.dart';
import 'package:calculator_flutter_app/common/widgets/app_text.dart';
import 'package:calculator_flutter_app/gen/assets.gen.dart';
import 'package:calculator_flutter_app/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialSignInButtons extends StatelessWidget {
  const SocialSignInButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 52.h,
          width: 158.w,
          padding: EdgeInsets.symmetric(
            vertical: 14.h,
            horizontal: 16.w,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.r),
            color: R.colors.greyTextField,
          ),
          child: Row(
            children: [
              Assets.pngs.googleIcon.image(
                height: 24.r,
                width: 24.r,
              ),
              16.wb,
              AppText(
                text: 'Google',
                fontSize: 16,
                color: R.colors.secondary,
              ),
            ],
          ),
        ),
        Container(
          height: 52.h,
          width: 158.w,
          padding: EdgeInsets.symmetric(
            vertical: 14.h,
            horizontal: 16.w,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.r),
            color: R.colors.greyTextField,
          ),
          child: Row(
            children: [
              Assets.pngs.fbIcon.image(
                height: 24.r,
                width: 24.r,
              ),
              16.wb,
              AppText(
                text: 'Facebook',
                fontSize: 16,
                color: R.colors.secondary,
              ),
            ],
          ),
        )
      ],
    );
  }
}
