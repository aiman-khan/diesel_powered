import 'package:diesel_powered/common/extensions/num.dart';
import 'package:diesel_powered/common/widgets/app_filled_button.dart';
import 'package:diesel_powered/common/widgets/app_text.dart';
import 'package:diesel_powered/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TermsOfServicePopup extends ConsumerWidget {
  const TermsOfServicePopup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () => GoRouter.of(context).pop(),
              child: Assets.svgs.closeIcon.svg(
                height: 32.r,
                width: 32.r,
              ),
            ),
          ),
          const Center(
            child: AppText(
              text: 'Terms of Service',
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
          26.hb,
          const Center(
            child: AppText(
              text: 'Lorem ipsum dolor sit amet, consectetur adipiscing '
                  'elit. Etiam eu turpis molestie, dictum est a, '
                  'mattis tellus. Sed dignissim, metus nec '
                  'fringilla accumsan, risus sem sollicitudin lacus, ut'
                  ' interdum tellus elit sed risus. Maecenas eget.'
                  'Curabitur tempor quis eros tempus lacinia. '
                  'Nam bibendum pellentesque quam a convallis.'
                  ' Sed ut vulputate nisi. Integer in felis sed leo '
                  'vestibulum venenatis. Suspendisse quis arcu sem.'
                  ' Aenean feugiat ex eu vestibulum vestibulum.'
                  ' Morbi a eleifend magna. Nam metus lacus, porttitor eu '
                  'mauris a, blandit ultrices nibh. Mauris sit amet'
                  ' magna non ligula vestibulum eleifend. Nulla varius '
                  'volutpat turpis sed lacinia. Nam eget mi in '
                  'purus lobortis eleifend. Sed nec ante ',
              fontSize: 14,
              height: 1.3,
            ),
          ),
          18.hb,
          const Spacer(),
          Center(
            child: AppFilledButton(
              text: 'I accept',
              onTap: () {},
            ),
          ),
          29.hb,
        ],
      ),
    );
  }
}
