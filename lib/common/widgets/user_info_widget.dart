import 'package:calculator_flutter_app/common/extensions/num.dart';
import 'package:calculator_flutter_app/common/widgets/app_text.dart';
import 'package:calculator_flutter_app/common/widgets/shimmer_effect.dart';
import 'package:calculator_flutter_app/common/widgets/user_avatar.dart';
import 'package:calculator_flutter_app/features/auth/presentation/providers/user_provider/user_provider.dart';
import 'package:calculator_flutter_app/gen/assets.gen.dart';
import 'package:calculator_flutter_app/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final userAsync = ref.watch(userProvider);

        if (!userAsync.hasValue) {
          return Row(
            children: [
              ShimmerEffect(
                child: CircleAvatar(
                  radius: 26.r,
                  backgroundColor: R.colors.black,
                ),
              ),
              8.wb,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShimmerEffect(
                    child: Container(
                      height: 12.h,
                      width: 150.w,
                      color: R.colors.black,
                    ),
                  ),
                  16.hb,
                  ShimmerEffect(
                    child: Container(
                      height: 10.h,
                      width: 100.w,
                      color: R.colors.black,
                    ),
                  ),
                ],
              ),
            ],
          );
        }

        final user = userAsync.value;

        return Row(
          children: [
            UserProfileAvatar(
              image: user!.img,
              size: 54.r,
            ),
            12.wb,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: user.name,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                AppText(
                  text: user.email,
                  fontSize: 12,
                  color: R.colors.secondary.withOpacity(0.5),
                ),
              ],
            ),
            const Spacer(),
            Assets.svgs.notificationIcon.svg(),
          ],
        );
      },
    );
  }
}
