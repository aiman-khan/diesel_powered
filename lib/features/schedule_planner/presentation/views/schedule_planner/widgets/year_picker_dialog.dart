import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YearPickerDialog extends StatelessWidget {
  final int selectedYear;

  const YearPickerDialog({super.key, required this.selectedYear});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Year'),
      content: SizedBox(
        width: double.minPositive,
        height: 400.h,
        child: ListView.builder(
          itemCount: 21,
          itemBuilder: (context, index) {
            int year = 2000 + index;
            return ListTile(
              title: Text(year.toString()),
              onTap: () {
                Navigator.of(context).pop(year);
              },
              selected: year == selectedYear,
              selectedTileColor: Colors.grey[200],
            );
          },
        ),
      ),
    );
  }
}
