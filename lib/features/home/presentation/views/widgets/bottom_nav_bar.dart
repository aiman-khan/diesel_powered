import 'package:calculator_flutter_app/features/home/domain/enums/bottom_nav_item.dart';
import 'package:calculator_flutter_app/features/home/presentation/providers/selected_nav_item_provider/selected_nav_item_provider.dart';
import 'package:calculator_flutter_app/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBottomNavBar extends ConsumerWidget {
  const AppBottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedNavItem = ref.watch(selectedNavItemProvider);

    return Container(
      color: R.colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            height: 1.h,
            width: 1.sw,
            color: R.colors.primary.withOpacity(0.2),
          ),
          SizedBox(
            height: 62.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                BottomNavItem.values.length,
                (index) {
                  final currentItem = BottomNavItem.values[index];

                  return InkWell(
                    borderRadius: BorderRadius.circular(8.r),
                    onTap: () {
                      ref.read(selectedNavItemProvider.notifier).state =
                          currentItem;
                    },
                    child: Padding(
                      padding: EdgeInsets.all(4.r),
                      child: SizedBox(
                        width: 24.r,
                        height: 24.r,
                        child: SvgPicture.asset(
                          currentItem.iconPath,
                          colorFilter: ColorFilter.mode(
                            currentItem == selectedNavItem
                                ? R.colors.primary
                                : R.colors.secondary,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
