import 'package:calculator_flutter_app/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDropdownWidget<T extends Object?> extends StatefulWidget {
  const AppDropdownWidget({
    required this.onChanged,
    required this.title,
    required this.items,
    required this.hint,
    this.value,
    this.color,
    this.borderColor,
    this.fontSize,
    super.key,
  });

  final void Function(T? value) onChanged;
  final String Function(T? value) title;
  final List<T> items;
  final String hint;
  final Color? color;
  final Color? borderColor;
  final T? value;
  final double? fontSize;

  @override
  State<AppDropdownWidget> createState() => _AppDropdownWidgetState<T>();
}

class _AppDropdownWidgetState<T extends Object?>
    extends State<AppDropdownWidget<T>> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 55.h),
      padding: EdgeInsets.only(
        left: 12.w,
        right: 12.w,
        top: 3.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(
          color: widget.borderColor ?? R.colors.primary,
        ),
        color: widget.color ?? Colors.white,
      ),
      child: DropdownButton<T?>(
        value: widget.value,
        borderRadius: BorderRadius.circular(10.r),
        hint: Text(
          widget.hint,
          style: TextStyle(
            fontSize: 16.sp,
            color: R.colors.black,
          ),
        ),
        underline: const SizedBox(),
        isExpanded: true,
        icon: const Icon(Icons.keyboard_arrow_down_outlined),
        elevation: 16,
        style: TextStyle(color: R.colors.black),
        onChanged: (T? value) {
          widget.onChanged.call(value);
        },
        items: widget.items.map<DropdownMenuItem<T>>((T value) {
          return DropdownMenuItem<T>(
            value: value,
            child: Text(
              widget.title(value),
              style: TextStyle(fontSize: 16.sp),
            ),
          );
        }).toList(),
      ),
    );
  }
}
