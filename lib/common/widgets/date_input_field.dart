import 'package:calculator_flutter_app/common/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateInputField extends StatefulWidget {
  const DateInputField({
    this.labelText,
    required this.hintText,
    this.onChanged,
    this.controller,
    this.validator,
    this.fillColor,
    this.datePickerPrimaryColor,
    super.key,
  });

  final void Function(String?)? onChanged;
  final String? labelText;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Color? fillColor;
  final Color? datePickerPrimaryColor;

  @override
  State<DateInputField> createState() => _DateInputFieldState();
}

class _DateInputFieldState extends State<DateInputField> {
  final dateInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      labelText: widget.labelText,
      hintText: widget.hintText,
      onTap: () async {
        final dateSelected = await showDatePicker(
          context: context,
          firstDate: DateTime(1990),
          lastDate: DateTime(2070),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: widget.datePickerPrimaryColor ??
                      Theme.of(context).primaryColor,
                  onPrimary: Colors.white,
                  onSurface: Colors.black,
                ),
                dialogBackgroundColor: Colors.white,
              ),
              child: child!,
            );
          },
        );

        final formattedDate = DateFormat('dd-MM-yyyy').format(dateSelected!);
        dateInput.text = formattedDate;
        widget.onChanged!(dateInput.text);
      },
      controller: dateInput,
      keyboardType: TextInputType.name,
      fillColor: widget.fillColor,
      validator: widget.validator ??
          (v) {
            if (v?.isEmpty ?? false) {
              return '${widget.hintText} is required';
            }
            return null;
          },
      onChanged: (v) async {
        final dateSelected = await showDatePicker(
          context: context,
          firstDate: DateTime(1990),
          lastDate: DateTime(2070),
        );

        final formattedDate = DateFormat('dd-MM-yyyy').format(dateSelected!);
        dateInput.text = formattedDate;
        widget.onChanged!(dateInput.text);
      },
    );
  }
}
