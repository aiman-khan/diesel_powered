import 'package:diesel_powered/common/extensions/num.dart';
import 'package:diesel_powered/common/widgets/app_text.dart';
import 'package:diesel_powered/features/premium/presentation/views/popups/get_premium_popup.dart';
import 'package:diesel_powered/gen/assets.gen.dart';
import 'package:diesel_powered/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetPremiumCardWidget extends StatelessWidget {
  const GetPremiumCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: R.colors.white,
          isScrollControlled: true,
          builder: (context) {
            return const GetPremiumPopup();
          },
        );
      },
      child: Container(
        height: 96.h,
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          gradient: LinearGradient(
            colors: [
              R.colors.primary,
              R.colors.primary,
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 64.r,
              width: 64.r,
              child: Assets.pngs.premiumBadge.image(),
            ),
            16.wb,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  text: 'Get Premium Today',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: R.colors.white,
                  letterSpacing: 0.08,
                ),
                AppText(
                  text: 'Remove Ads & Unlock All Feature',
                  color: R.colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
