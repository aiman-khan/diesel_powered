import 'package:calculator_flutter_app/common/widgets/custom_text_form_field.dart';
import 'package:calculator_flutter_app/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      prefixIcon: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Icon(
          Icons.search_rounded,
          size: 24.r,
          color: R.colors.greyTextField,
        ),
      ),
      hintText: 'Search',
      onChanged: (v) {
        //
      },
      labelText: '',
      keyboardType: TextInputType.text,
      validator: (v) {
        return null;
      },
    );
  }
}
