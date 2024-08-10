import 'package:flutter_riverpod/flutter_riverpod.dart';

class Task {
  final String title;
  final DateTime startTime;
  final DateTime endTime;
  final String description;

  Task(
      {required this.title,
      required this.startTime,
      required this.endTime,
      this.description = ''});
}

class TaskNotifier extends StateNotifier<Map<DateTime, List<Task>>> {
  TaskNotifier() : super({});

  void addTask(DateTime date, Task task) {
    state = {
      ...state,
      date: [...state[date] ?? [], task]
    };
  }

  void editTask(DateTime date, int index, Task task) {
    state[date]![index] = task;
    state = {...state};
  }

  void deleteTask(DateTime date, int index) {
    state[date]!.removeAt(index);
    if (state[date]!.isEmpty) {
      state.remove(date);
    }
    state = {...state};
  }
}

final taskProvider =
    StateNotifierProvider<TaskNotifier, Map<DateTime, List<Task>>>((ref) {
  return TaskNotifier();
});
