import 'package:calculator_flutter_app/common/extensions/num.dart';
import 'package:calculator_flutter_app/common/widgets/app_filled_button.dart';
import 'package:calculator_flutter_app/common/widgets/app_text.dart';
import 'package:calculator_flutter_app/common/widgets/back_button_widget.dart';
import 'package:calculator_flutter_app/common/widgets/text_input_field.dart';
import 'package:calculator_flutter_app/gen/assets.gen.dart';
import 'package:calculator_flutter_app/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationTrackerView extends StatelessWidget {
  const LocationTrackerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: 1.sw,
            height: 1.sh,
            child: Column(
              children: [
                const BackButtonWidget(
                  title: 'Location Tracker',
                ),
                Container(
                  height: 414.h,
                  color: R.colors.primary.withOpacity(0.3),
                  child: const Center(
                    child: const AppText(
                      text: 'Map Here',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: 1.sw,
              height: 334.h,
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 24.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
                color: R.colors.white,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Assets.svgs.pinIcon.svg(),
                      14.wb,
                      SizedBox(
                        width: 285.w,
                        child: TextInputField(
                          onChanged: (v) {},
                          hintText: 'Your Location',
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.more_vert_sharp,
                          color: R.colors.primary,
                        ),
                        Assets.svgs.swapIcon.svg(),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Assets.svgs.wheretToIcon.svg(),
                      14.wb,
                      SizedBox(
                        width: 285.w,
                        child: TextInputField(
                          onChanged: (v) {},
                          hintText: 'Where to?',
                        ),
                      ),
                    ],
                  ),
                  27.hb,
                  AppFilledButton(
                    text: 'Start Tracking',
                    onTap: () {},
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
