import 'package:calculator_flutter_app/common/extensions/num.dart';
import 'package:calculator_flutter_app/common/widgets/app_text.dart';
import 'package:calculator_flutter_app/common/widgets/back_button_widget.dart';
import 'package:calculator_flutter_app/features/about/presentation/providers/privacy_policy_provider/privacy_policy_provider.dart';
import 'package:calculator_flutter_app/features/about/presentation/views/about/widgets/content_loading_widget.dart';
import 'package:calculator_flutter_app/features/about/presentation/views/about/widgets/content_widget.dart';
import 'package:calculator_flutter_app/features/about/presentation/views/about/widgets/sliver_persistance_header.dart';
import 'package:calculator_flutter_app/gen/assets.gen.dart';
import 'package:calculator_flutter_app/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPolicyView extends ConsumerWidget {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaPadding = MediaQuery.of(context).padding;

    return Scaffold(
      backgroundColor: R.colors.white,
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            mediaPadding.top.hb,
            BackButtonWidget(
              color: R.colors.black,
            ),
            10.hb,
            Center(
              child: AppText(
                text: 'Privacy Policy',
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: R.colors.black,
              ),
            ),
            15.hb,
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.w),
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    /// [App Image]
                    SliverPersistentHeader(
                      delegate: SliverAppBarDelegate(
                        minHeight: 0,
                        maxHeight: 256.h,
                        child: Assets.svgs.aboutIcon.svg(width: 335),
                      ),
                    ),

                    /// [Privacy Policy text]
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          15.hb,
                          Consumer(
                            builder: (context, ref, _) {
                              final privacyPolicyAsync =
                                  ref.watch(getPrivacyPolicyProvider);

                              if (!privacyPolicyAsync.hasValue) {
                                return const ContentLoadingWidget();
                              }

                              final privacyPolicy = privacyPolicyAsync.value;

                              return ContentWidget(content: privacyPolicy!);
                            },
                          ),
                          45.hb,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            mediaPadding.top.hb,
          ],
        ),
      ),
    );
  }
}
