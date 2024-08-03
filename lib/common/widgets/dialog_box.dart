import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({
    required this.content,
    super.key,
  });

  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.r),
            child: SizedBox(
              width: 358.w,
              child: content,
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
