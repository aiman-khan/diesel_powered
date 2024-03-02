import 'package:diesel_powered/common/extensions/num.dart';
import 'package:diesel_powered/common/widgets/app_filled_button.dart';
import 'package:diesel_powered/common/widgets/back_button_widget.dart';
import 'package:diesel_powered/common/widgets/date_input_field.dart';
import 'package:diesel_powered/common/widgets/number_input_field.dart';
import 'package:diesel_powered/common/widgets/text_input_field.dart';
import 'package:diesel_powered/util/resources/r.dart';
import 'package:diesel_powered/util/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCardView extends StatefulWidget {
  const AddCardView({super.key});

  @override
  State<AddCardView> createState() => _AddCardViewState();
}

class _AddCardViewState extends State<AddCardView> {
  final _formKey = GlobalKey<FormState>();

  void _save() {
    if (_formKey.currentState!.validate()) {
      showToast(msg: 'Card added successfully');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const BackButtonWidget(title: 'Add Card'),
            31.hb,
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextInputField(
                        onChanged: (v) {},
                        hintText: 'Card Holder Name',
                        color: R.colors.greyTextField,
                      ),
                      16.hb,
                      NumberInputField(
                        onChanged: (v) {},
                        name: 'Card Number',
                        hintText: 'Card Number',
                        fillColor: R.colors.greyTextField,
                      ),
                      16.hb,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: SizedBox(
                              width: 159.w,
                              child: DateInputField(
                                onChanged: (v) {},
                                hintText: 'Expiry Date',
                                fillColor: R.colors.greyTextField,
                                datePickerPrimaryColor: R.colors.primary,
                              ),
                            ),
                          ),
                          Flexible(
                            child: SizedBox(
                              width: 159.w,
                              child: NumberInputField(
                                onChanged: (v) {},
                                hintText: 'CVV',
                                name: 'CVV',
                                fillColor: R.colors.greyTextField,
                              ),
                            ),
                          ),
                        ],
                      ),
                      40.hb,
                      AppFilledButton(
                        text: 'Save',
                        onTap: _save,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
