import 'package:diesel_powered/common/extensions/num.dart';
import 'package:diesel_powered/common/widgets/app_text.dart';
import 'package:diesel_powered/common/widgets/back_button_widget.dart';
import 'package:diesel_powered/features/schedule_planner/presentation/providers/task_provider.dart';
import 'package:diesel_powered/features/schedule_planner/presentation/views/add_task/add_task_view.dart';
import 'package:diesel_powered/features/schedule_planner/presentation/views/schedule_planner/widgets/year_picker_dialog.dart';
import 'package:diesel_powered/util/resources/r.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class SchedulePlanner extends ConsumerStatefulWidget {
  const SchedulePlanner({super.key});

  @override
  ConsumerState createState() => _SchedulePlannerState();
}

class _SchedulePlannerState extends ConsumerState<SchedulePlanner> {
  DateTime selectedDate = DateTime.now();
  int selectedYear = DateTime.now().year;

  List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  void _addTask() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: R.colors.white,
      builder: (context) {
        return AddTaskView(selectedDate: selectedDate);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(taskProvider);
    return Column(
      children: [
        const BackButtonWidget(title: 'Schedule Planner'),
        20.hb,
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 19.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildYearWidget(context),
                    _buildTaskButton(),
                  ],
                ),
                24.hb,
                _buildMonthsList(),
                26.hb,
                _buildDaysList(),
                _buildTimeSchedule(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  final DateFormat timeFormat = DateFormat('h:mm a');

  Widget _buildTimeSchedule() {
    return Expanded(
      child: Consumer(
        builder: (context, ref, child) {
          final tasks = ref.watch(taskProvider)[selectedDate] ?? [];
          return ListView.builder(
            itemCount: 24,
            itemBuilder: (context, index) {
              DateTime time = DateTime(selectedDate.year, selectedDate.month,
                  selectedDate.day, index);
              Task? task;
              if (tasks.isNotEmpty) {
                task = tasks.firstWhere(
                  (task) => task.startTime.hour == index,
                  orElse: () => Task(title: '', startTime: time, endTime: time),
                );
              }
              return ListTile(
                leading: AppText(
                  text: "${time.hour}:00",
                  fontSize: 12,
                  color: R.colors.black.withOpacity(0.5),
                ),
                title: task != null && task.title.isNotEmpty
                    ? Container(
                        width: 221.w,
                        constraints: BoxConstraints(maxHeight: 97.h),
                        decoration: BoxDecoration(
                          color: R.colors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 8.w,
                              decoration: BoxDecoration(
                                color: R.colors.primary,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.r),
                                  bottomLeft: Radius.circular(10.r),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14.h,
                                vertical: 8.h,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppText(
                                    text:
                                        '${timeFormat.format(task.startTime)} - ${timeFormat.format(task.endTime)}',
                                    fontSize: 10,
                                    color: R.colors.black.withOpacity(0.6),
                                  ),
                                  6.hb,
                                  AppText(
                                    text: task.title,
                                    fontSize: 14,
                                    color: R.colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  6.hb,
                                  SizedBox(
                                    width: 200.w,
                                    child: AppText(
                                      text: task.description,
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 10,
                                      color: R.colors.black.withOpacity(0.5),
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : null,
                // trailing: task != null && task.title.isNotEmpty
                //     ? Row(
                //         mainAxisSize: MainAxisSize.min,
                //         children: [
                //           IconButton(
                //             icon: Icon(Icons.edit),
                //             onPressed: () {
                //               // Edit task
                //             },
                //           ),
                //           IconButton(
                //             icon: Icon(Icons.delete),
                //             onPressed: () {
                //               ref.read(taskProvider.notifier).deleteTask(
                //                   selectedDate, tasks.indexOf(task!));
                //             },
                //           ),
                //         ],
                //       )
                //     : null,
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildDaysList() {
    return SizedBox(
      height: 80.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: DateTime(selectedDate.year, selectedDate.month + 1, 0).day,
        itemBuilder: (context, index) {
          DateTime date =
              DateTime(selectedDate.year, selectedDate.month, index + 1);
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedDate = date;
              });
            },
            child: Container(
              width: 50.w,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 40.w,
                    child: Center(
                      child: Text(
                        DateFormat('EEE').format(date),
                        style: TextStyle(
                          color: selectedDate.day == index + 1
                              ? R.colors.black
                              : R.colors.black.withOpacity(0.5),
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                  18.hb,
                  SizedBox(
                    width: 40.w,
                    child: Center(
                      child: CircleAvatar(
                        backgroundColor: selectedDate.day == index + 1
                            ? R.colors.primary
                            : R.colors.white,
                        child: Text(
                          (index + 1).toString(),
                          style: TextStyle(
                            color: selectedDate.day == index + 1
                                ? Colors.white
                                : Colors.black,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMonthsList() {
    return SizedBox(
      height: 39.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: months.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 8.w),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedDate = DateTime(selectedYear, index + 1, 1);
                });
              },
              child: Container(
                width: 100.w,
                height: 39.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: R.colors.white,
                  border: Border.all(
                    color: selectedDate.month == index + 1
                        ? R.colors.primary
                        : R.colors.black.withOpacity(0.2),
                  ),
                  borderRadius: BorderRadius.circular(47.r),
                ),
                child: Text(
                  months[index],
                  style: TextStyle(
                    color: R.colors.black,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTaskButton() {
    return InkWell(
      onTap: _addTask,
      borderRadius: BorderRadius.circular(56.r),
      child: Container(
        width: 119.w,
        height: 42.h,
        decoration: BoxDecoration(
          color: R.colors.primary,
          borderRadius: BorderRadius.circular(56.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              size: 18.r,
              color: R.colors.white,
            ),
            8.wb,
            AppText(
              text: 'Add Task',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: R.colors.white,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildYearWidget(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        int? year = await showDialog(
          context: context,
          builder: (context) => YearPickerDialog(selectedYear: selectedYear),
        );
        if (year != null) {
          setState(() {
            selectedYear = year;
            selectedDate = DateTime(selectedYear, selectedDate.month, 1);
          });
        }
      },
      child: Row(
        children: [
          Text(
            "$selectedYear",
            style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold),
          ),
          8.wb,
          Icon(
            Icons.keyboard_arrow_down,
            size: 16.r,
          )
        ],
      ),
    );
  }
}
