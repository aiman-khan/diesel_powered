import 'package:flutter/material.dart';

class NotchBottomBarController extends ChangeNotifier {
  int index;
  int? oldIndex;

  NotchBottomBarController({this.index = 0});

  void jumpTo(int index) {
    oldIndex = this.index;
    this.index = index;
    notifyListeners();
  }
}
