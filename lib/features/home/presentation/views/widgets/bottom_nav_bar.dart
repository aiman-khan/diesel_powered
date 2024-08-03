import 'package:diesel_powered/features/home/domain/enums/bottom_nav_item.dart';
import 'package:diesel_powered/features/home/presentation/providers/selected_nav_item_provider/selected_nav_item_provider.dart';
import 'package:diesel_powered/features/home/presentation/views/widgets/bottom_bar/models/bottom_bar_item_model.dart';
import 'package:diesel_powered/features/home/presentation/views/widgets/bottom_bar/notch_bottom_bar.dart';
import 'package:diesel_powered/features/home/presentation/views/widgets/bottom_bar/notch_bottom_bar_controller.dart';
import 'package:diesel_powered/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBottomNavBar extends ConsumerStatefulWidget {
  const AppBottomNavBar({required this.bottomBarController, super.key});

  final NotchBottomBarController bottomBarController;

  @override
  ConsumerState<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends ConsumerState<AppBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final currentItem = ref.watch(selectedNavItemProvider);

    return AnimatedNotchBottomBar(
      notchBottomBarController: widget.bottomBarController,
      color: R.colors.primary,
      bottomBarItems: List.generate(
        BottomNavItem.values.length,
        (index) {
          return BottomBarItem(
            activeItem: SvgPicture.asset(
              BottomNavItem.values[index].iconPath,
              colorFilter: ColorFilter.mode(
                R.colors.primary,
                BlendMode.srcIn,
              ),
            ),
            inActiveItem: SvgPicture.asset(
              BottomNavItem.values[index].iconPath,
              colorFilter: ColorFilter.mode(
                R.colors.white,
                BlendMode.srcIn,
              ),
            ),
            itemLabelWidget: Text(
              BottomNavItem.values[index].name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: R.colors.white,
                fontSize: 9.sp,
              ),
            ),
          );
        },
      ),
      onTap: (int value) {
        if (value == BottomNavItem.postLoad.index) {
          widget.bottomBarController.jumpTo(currentItem.index);
          showModalBottomSheet<void>(
            context: context,
            showDragHandle: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.r),
                topRight: Radius.circular(30.r),
              ),
            ),
            builder: (context) {
              return const SizedBox();
            },
          );
        } else {
          ref.read(selectedNavItemProvider.notifier).state =
              BottomNavItem.values[value];
        }
      },
      kIconSize: 24,
      kBottomRadius: 32,
      elevation: 2,
      circleMargin: 8.r,
    );
  }
}
