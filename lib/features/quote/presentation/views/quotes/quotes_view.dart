import 'package:diesel_powered/common/extensions/num.dart';
import 'package:diesel_powered/common/widgets/app_text.dart';
import 'package:diesel_powered/common/widgets/back_button_widget.dart';
import 'package:diesel_powered/features/quote/domain/models/photo/photo_model.dart';
import 'package:diesel_powered/features/quote/presentation/providers/get_random_photo_provider.dart';
import 'package:diesel_powered/features/quote/presentation/providers/get_random_quote_provider.dart';
import 'package:diesel_powered/features/splash/presentation/splash_view.dart';
import 'package:diesel_powered/gen/assets.gen.dart';
import 'package:diesel_powered/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class QuotesView extends ConsumerStatefulWidget {
  const QuotesView({super.key});

  @override
  ConsumerState<QuotesView> createState() => _QuotesViewState();
}

class _QuotesViewState extends ConsumerState<QuotesView> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.white,
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              children: [
                BackButtonWidget(title: 'Quotes'),
                20.hb,
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: 'Quote of the Day',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: R.colors.secondary,
                        ),
                        16.hb,
                        Consumer(builder: (context, ref, _) {
                          final photoAsync = ref.watch(getRandomPhotoProvider);
                          final quoteAsync = ref.watch(getRandomQuoteProvider);

                          if (!photoAsync.hasValue || !quoteAsync.hasValue) {
                            return Shimmer.fromColors(
                              highlightColor: Colors.grey.shade100,
                              baseColor: Colors.grey.shade300,
                              child: Container(
                                height: 200.h,
                                width: 330.w,
                                decoration: BoxDecoration(
                                  color: R.colors.black,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(14.r),
                                  ),
                                ),
                              ),
                            );
                          }

                          final photo = photoAsync.value;
                          final quote = quoteAsync.value;

                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: 200.h,
                                width: 330.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(14.r),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(14.r),
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: photo!.urls.small,
                                    fit: BoxFit.cover,
                                    progressIndicatorBuilder: (context, _, __) {
                                      return Shimmer.fromColors(
                                        highlightColor: Colors.grey.shade100,
                                        baseColor: Colors.grey.shade300,
                                        child: Container(
                                          height: 200.h,
                                          width: 330.w,
                                          decoration: BoxDecoration(
                                            color: R.colors.black,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(14.r),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                width: 200.w,
                                padding: EdgeInsets.all(12.r),
                                decoration: BoxDecoration(
                                  color: R.colors.black.withOpacity(0.55),
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      quote?.content ?? '',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.merriweather(
                                        fontSize: 14.sp,
                                        color: R.colors.white,
                                      ),
                                    ),
                                    12.hb,
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        '~ ${quote?.author ?? ''}',
                                        textAlign: TextAlign.right,
                                        style: GoogleFonts.dancingScript(
                                          fontSize: 18.sp,
                                          color: R.colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
