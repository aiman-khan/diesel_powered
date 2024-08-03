import 'package:diesel_powered/common/extensions/num.dart';
import 'package:diesel_powered/common/widgets/back_button_widget.dart';
import 'package:diesel_powered/gen/assets.gen.dart';
import 'package:diesel_powered/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthBgWidget extends StatelessWidget {
  const AuthBgWidget({
    required this.child,
    this.hasBackButton = true,
    this.height,
    super.key,
  });

  final Widget child;
  final bool hasBackButton;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: 1.sw,
            height: 1.sh,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.pngs.authBg.path),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                44.hb,
                if (hasBackButton)
                  BackButtonWidget(
                    color: R.colors.white,
                  ),
                132.hb,
                Assets.svgs.appLogo.svg(
                  width: 165.w,
                  height: 50.h,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0.h,
            child: Container(
              width: 1.sw,
              height: height?.h ?? 665.h,
              decoration: BoxDecoration(
                color: R.colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
              child: KeyboardDismissOnTap(
                child: child,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
