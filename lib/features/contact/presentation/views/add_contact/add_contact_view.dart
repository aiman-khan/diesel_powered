import 'package:diesel_powered/common/extensions/num.dart';
import 'package:diesel_powered/common/widgets/app_filled_button.dart';
import 'package:diesel_powered/common/widgets/back_button_widget.dart';
import 'package:diesel_powered/common/widgets/number_input_field.dart';
import 'package:diesel_powered/common/widgets/text_input_field.dart';
import 'package:diesel_powered/common/widgets/user_avatar.dart';
import 'package:diesel_powered/util/resources/r.dart';
import 'package:diesel_powered/util/toast/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddContactView extends StatefulWidget {
  const AddContactView({super.key});

  @override
  State<AddContactView> createState() => _AddContactViewState();
}

class _AddContactViewState extends State<AddContactView> {
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
            const BackButtonWidget(title: 'New Contact'),
            31.hb,
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      UserProfileAvatar(
                        size: 88.r,
                        hasBorder: true,
                      ),
                      24.hb,
                      TextInputField(
                        onChanged: (v) {},
                        hintText: 'First Name',
                        color: R.colors.greyTextField,
                      ),
                      16.hb,
                      TextInputField(
                        onChanged: (v) {},
                        hintText: 'Last Name',
                        color: R.colors.greyTextField,
                      ),
                      16.hb,
                      NumberInputField(
                        onChanged: (v) {},
                        name: 'Phone Number',
                        hintText: 'Phone Number',
                        fillColor: R.colors.greyTextField,
                      ),
                      36.hb,
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
