import 'package:calculator_flutter_app/common/extensions/num.dart';
import 'package:calculator_flutter_app/common/widgets/app_filled_button.dart';
import 'package:calculator_flutter_app/common/widgets/app_text.dart';
import 'package:calculator_flutter_app/common/widgets/dialog_box.dart';
import 'package:calculator_flutter_app/common/widgets/number_input_field.dart';
import 'package:calculator_flutter_app/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalculationForm extends StatefulWidget {
  const CalculationForm({super.key});

  @override
  State<CalculationForm> createState() => _CalculationFormState();
}

class _CalculationFormState extends State<CalculationForm> {
  final _lengthInputController = TextEditingController();
  final _widthInputController = TextEditingController();
  final _thicknessInputController = TextEditingController();

  double total = 0;

  void _calculate() {
    final length = double.tryParse(_lengthInputController.text) ?? 0;
    final width = double.tryParse(_widthInputController.text) ?? 0;
    final thickness = double.tryParse(_thicknessInputController.text) ?? 0;

    // Convert thickness from inches to feet
    final thicknessInFeet = thickness / 12;

    // Calculate volume in cubic feet
    final volumeInCubicFeet = length * width * thicknessInFeet;

    // Convert volume to cubic yards
    total = volumeInCubicFeet / 27;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buldField(
          name: 'Length',
          trailingText: 'Feet',
          controller: _lengthInputController,
          onChanged: (v) {},
        ),
        16.hb,
        _buldField(
          name: 'Width',
          trailingText: 'Feet',
          controller: _widthInputController,
          onChanged: (v) {},
        ),
        16.hb,
        _buldField(
          name: 'Thickness',
          trailingText: 'Inches',
          controller: _thicknessInputController,
          onChanged: (v) {},
        ),
        40.hb,
        AppFilledButton(
          text: 'Calculate',
          onTap: () {
            _calculate();
            showDialog(
              context: context,
              builder: (context) {
                return _buildCalculationDialog();
              },
            );
          },
        )
      ],
    );
  }

  Widget _buildCalculationDialog() {
    return DialogBox(
      content: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 24.h,
          horizontal: 40.w,
        ),
        child: Column(
          children: [
            const AppText(
              text: 'Calculation Result',
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            16.hb,
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 14.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(31.r),
                color: R.colors.primary,
              ),
              child: AppText(
                text: '${total.toStringAsFixed(2)} Cubic Yards',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: R.colors.white,
              ),
            ),
            16.hb,
            AppText(
              textAlign: TextAlign.center,
              height: 1.5.h,
              fontSize: 13,
              text:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buldField({
    required void Function(String?) onChanged,
    required String name,
    required TextEditingController controller,
    required String trailingText,
  }) {
    return NumberInputField(
      onChanged: (v) {},
      name: name,
      hintText: name,
      fillColor: R.colors.greyTextField,
      labelText: name,
      controller: controller,
      suffixIcon: Padding(
        padding: EdgeInsets.only(right: 24.w),
        child: AppText(
          text: trailingText,
          fontSize: 14,
          color: R.colors.primary,
        ),
      ),
    );
  }
}
