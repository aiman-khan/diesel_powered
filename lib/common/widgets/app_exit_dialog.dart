import 'package:diesel_powered/common/widgets/app_filled_button.dart';
import 'package:diesel_powered/common/widgets/app_outlined_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AppExitDialog extends StatelessWidget {
  const AppExitDialog({
    super.key,
    this.color,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      title: Text(
        'Confirm',
        style: TextStyle(
          color: color ?? Colors.blue,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
        textAlign: TextAlign.center,
      ),
      content: Text(
        'Are you sure you want to exit the application?',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.sp,
        ),
        textAlign: TextAlign.center,
      ),
      actions: [
        const AppFilledButton(
          text: 'Yes',
          onTap: SystemNavigator.pop,
          width: 100,
          height: 40,
        ),
        AppOutlinedTextButton(
          text: 'No',
          onTap: () => GoRouter.of(context).pop(),
          width: 100,
          height: 40,
        ),
      ],
    );
  }
}
