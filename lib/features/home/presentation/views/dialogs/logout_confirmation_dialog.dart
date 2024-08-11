import 'package:diesel_powered/common/extensions/num.dart';
import 'package:diesel_powered/common/widgets/app_filled_button.dart';
import 'package:diesel_powered/common/widgets/app_outlined_text_button.dart';
import 'package:diesel_powered/common/widgets/app_text.dart';
import 'package:diesel_powered/common/widgets/dialog_box.dart';
import 'package:diesel_powered/features/auth/presentation/providers/logout_provider/logout_provider.dart';
import 'package:diesel_powered/gen/assets.gen.dart';
import 'package:diesel_powered/util/loading/loading.dart';
import 'package:diesel_powered/util/resources/r.dart';
import 'package:diesel_powered/util/router/paths.dart';
import 'package:diesel_powered/util/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LogoutConfirmationPopup extends ConsumerWidget {
  const LogoutConfirmationPopup({super.key});

  Future<void> _logout(BuildContext context, WidgetRef ref) async {
    try {
      loading(context);
      await ref.read(logoutProvider.future);
      if (!context.mounted) return;
      GoRouter.of(context).go(RoutePaths.login);
    } catch (e) {
      showToast(msg: 'Something went wrong');
    } finally {
      dismissLoading();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DialogBox(
      content: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Column(
          children: [
            24.hb,
            Assets.svgs.logoutIcon.svg(
              height: 86.36.r,
              width: 86.36.r,
              colorFilter: ColorFilter.mode(
                R.colors.primary,
                BlendMode.srcIn,
              ),
            ),
            22.hb,
            AppText(
              text: 'Are you sure you want to log out?',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: R.colors.black,
              textAlign: TextAlign.center,
            ),
            32.hb,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppOutlinedTextButton(
                  width: 103,
                  height: 40,
                  text: 'Cancel',
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                ),
                AppFilledButton(
                  width: 103,
                  height: 40,
                  text: 'Yes',
                  onTap: () => _logout(context, ref),
                ),
              ],
            ),
            16.hb,
          ],
        ),
      ),
    );
  }
}
