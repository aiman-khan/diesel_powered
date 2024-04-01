import 'package:calculator_flutter_app/common/extensions/num.dart';
import 'package:calculator_flutter_app/common/widgets/back_button_widget.dart';
import 'package:calculator_flutter_app/features/calculator/presentation/views/calculate_item/widgets/calculation_form.dart';
import 'package:calculator_flutter_app/features/premium/presentation/views/widgets/get_premium_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalculateItemView extends StatelessWidget {
  const CalculateItemView({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            BackButtonWidget(
              title: title,
            ),
            31.hb,
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    const GetPremiumCardWidget(),
                    24.hb,
                    const CalculationForm(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
