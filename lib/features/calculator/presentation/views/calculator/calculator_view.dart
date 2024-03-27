import 'package:calculator_flutter_app/common/extensions/num.dart';
import 'package:calculator_flutter_app/common/widgets/app_text.dart';
import 'package:calculator_flutter_app/common/widgets/user_info_widget.dart';
import 'package:calculator_flutter_app/features/premium/presentation/views/widgets/get_premium_card_widget.dart';
import 'package:calculator_flutter_app/util/resources/r.dart';
import 'package:calculator_flutter_app/util/router/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  final calcList = [
    'Concrete Slab',
    'Concrete Footing',
    'Concrete Wall',
    'Concrete Steps',
    'Concrete Curb',
    'Concrete Column/Cylinder',
    'Sand, Gravel & Stone',
    'Concrete Block & Mortar',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          const UserInfoWidget(),
          20.hb,
          const GetPremiumCardWidget(),
          16.hb,
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: List.generate(
                  calcList.length,
                  (index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 16.h),
                      child: _buildCalculatorTile(
                        title: calcList[index],
                        onTap: () {
                          GoRouter.of(context).push(
                            RoutePaths.calculateItem,
                            extra: calcList[index],
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          56.hb,
        ],
      ),
    );
  }

  Widget _buildCalculatorTile({
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(107.r),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 16.h,
          horizontal: 24.w,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(107.r),
          color: R.colors.greyTextField,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              text: title,
              fontSize: 16,
            ),
            Icon(
              Icons.arrow_forward,
              size: 24.r,
              color: R.colors.primary,
            ),
          ],
        ),
      ),
    );
  }
}
