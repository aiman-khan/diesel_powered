import 'dart:async';

import 'package:calculator_flutter_app/common/extensions/num.dart';
import 'package:calculator_flutter_app/common/widgets/app_filled_button.dart';
import 'package:calculator_flutter_app/common/widgets/app_text.dart';
import 'package:calculator_flutter_app/common/widgets/back_button_widget.dart';
import 'package:calculator_flutter_app/common/widgets/custom_text_form_field.dart';
import 'package:calculator_flutter_app/common/widgets/text_input_field.dart';
import 'package:calculator_flutter_app/features/schedule_planner/presentation/providers/task_provider.dart';
import 'package:calculator_flutter_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AddTaskView extends StatefulWidget {
  final DateTime selectedDate;

  const AddTaskView({super.key, required this.selectedDate});

  @override
  State createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  final _formKey = GlobalKey<FormState>();
  late DateTime _selectedDate;

  TimeOfDay _selectedStartTime = const TimeOfDay(hour: 9, minute: 0);
  TimeOfDay _selectedEndTime = const TimeOfDay(hour: 10, minute: 0);

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _dateController = TextEditingController();
  final _startTimeController = TextEditingController();
  final _endTimeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() {
      loadData();
    });
  }

  loadData() {
    _selectedDate = widget.selectedDate;
    _dateController.text = DateFormat('dd-MM-yyyy').format(_selectedDate);
    _startTimeController.text = _selectedStartTime.format(context);
    _endTimeController.text = _selectedEndTime.format(context);
  }

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text = DateFormat('dd-MM-yyyy').format(_selectedDate);
      });
    }
  }

  Future<void> _pickTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: isStartTime ? _selectedStartTime : _selectedEndTime,
    );
    if (pickedTime != null) {
      setState(() {
        if (isStartTime) {
          _selectedStartTime = pickedTime;
          _startTimeController.text = _selectedStartTime.format(context);
        } else {
          _selectedEndTime = pickedTime;
          _endTimeController.text = _selectedEndTime.format(context);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        32.hb,
        const BackButtonWidget(
          title: 'Create Task',
        ),
        20.hb,
        Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 19.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextInputField(
                    controller: _titleController,
                    onChanged: (v) {},
                    hintText: 'Task Name',
                  ),
                  16.hb,
                  GestureDetector(
                    onTap: () => _pickDate(context),
                    child: AbsorbPointer(
                      child: CustomTextFormField(
                        controller: _dateController,
                        hintText: 'Select Date',
                        onChanged: (v) {},
                        keyboardType: TextInputType.text,
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(right: 22.w),
                          child: Assets.svgs.calendarIcon.svg(),
                        ),
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return 'Please select a date';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  16.hb,
                  GestureDetector(
                    onTap: () => _pickTime(context, true),
                    child: AbsorbPointer(
                      child: CustomTextFormField(
                        controller: _startTimeController,
                        hintText: 'Start Time',
                        onChanged: (v) {},
                        keyboardType: TextInputType.text,
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(right: 22.w),
                          child: Assets.svgs.clockIcon.svg(),
                        ),
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return 'Please select a start time';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  16.hb,
                  GestureDetector(
                    onTap: () => _pickTime(context, false),
                    child: AbsorbPointer(
                      child: CustomTextFormField(
                        controller: _endTimeController,
                        hintText: 'End Time',
                        onChanged: (v) {},
                        keyboardType: TextInputType.text,
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(right: 22.w),
                          child: Assets.svgs.clockIcon.svg(),
                        ),
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return 'Please select an end time';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  26.hb,
                  const AppText(
                    text: 'Description',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  16.hb,
                  TextInputField(
                    controller: _descriptionController,
                    onChanged: (v) {},
                    radius: 12,
                    hintText: 'Write Description here...',
                    maxLines: 5,
                    minLines: 5,
                  ),
                ],
              ),
            ),
          ),
        ),
        28.hb,
        Consumer(builder: (context, ref, _) {
          return AppFilledButton(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                var task = Task(
                  title: _titleController.text,
                  startTime: DateTime(
                    _selectedDate.year,
                    _selectedDate.month,
                    _selectedDate.day,
                    _selectedStartTime.hour,
                    _selectedStartTime.minute,
                  ),
                  endTime: DateTime(
                    _selectedDate.year,
                    _selectedDate.month,
                    _selectedDate.day,
                    _selectedEndTime.hour,
                    _selectedEndTime.minute,
                  ),
                  description: _descriptionController.text,
                );
                ref.read(taskProvider.notifier).addTask(_selectedDate, task);
                Navigator.of(context).pop();
              }
            },
            text: 'Create Task',
          );
        }),
      ],
    );
  }
}
