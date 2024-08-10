import 'package:calculator_flutter_app/common/extensions/num.dart';
import 'package:calculator_flutter_app/common/widgets/app_text.dart';
import 'package:calculator_flutter_app/common/widgets/back_button_widget.dart';
import 'package:calculator_flutter_app/gen/assets.gen.dart';
import 'package:calculator_flutter_app/util/resources/r.dart';
import 'package:calculator_flutter_app/util/router/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class GetPremiumPopup extends StatelessWidget {
  const GetPremiumPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        28.hb,
        const Align(
          alignment: Alignment.topLeft,
          child: BackButtonWidget(),
        ),
        32.hb,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Assets.pngs.premiumBadge.image(
                height: 74.r,
                width: 74.r,
              ),
              16.hb,
              AppText(
                text: 'Get Premium',
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: R.colors.secondary,
                textAlign: TextAlign.center,
              ),
              10.hb,
              AppText(
                text:
                    'Remove Ads & Unlock All Feature By\nChoosing Any Given Plan',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: R.colors.secondary.withOpacity(0.6),
                textAlign: TextAlign.center,
              ),
              36.hb,
              _buildPlanContainer(
                plan: 'Monthly Plan',
                price: '1.99',
                tenure: 'Month',
                colors: [
                  R.colors.secondary,
                  R.colors.secondary,
                ],
                onTap: () {
                  GoRouter.of(context).push(RoutePaths.paymentMethod);
                },
              ),
              16.hb,
              _buildPlanContainer(
                plan: 'Yearly Plan',
                price: '49.99',
                tenure: 'Year',
                colors: [
                  R.colors.primary,
                  R.colors.primary,
                ],
                onTap: () {
                  GoRouter.of(context).push(RoutePaths.paymentMethod);
                },
              ),
              36.hb,
              InkWell(
                onTap: () {
                  GoRouter.of(context).pop();
                },
                child: Padding(
                  padding: EdgeInsets.all(8.r),
                  child: const AppText(
                    text: 'Cancel',
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildPlanContainer({
    required String plan,
    required String price,
    required String tenure,
    required List<Color> colors,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        height: 96.h,
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          gradient: LinearGradient(
            colors: colors,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  text: plan,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: R.colors.white,
                  letterSpacing: 0.08,
                ),
                4.hb,
                AppText(
                  text: 'Unlock All Features',
                  color: R.colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 22.sp,
                  fontFamily: 'SF-Pro-Display',
                ),
                children: [
                  TextSpan(
                    text: '\$$price',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: '/$tenure',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: R.colors.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
