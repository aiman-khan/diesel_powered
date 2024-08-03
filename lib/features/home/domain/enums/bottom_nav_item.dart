import 'package:diesel_powered/gen/assets.gen.dart';

enum BottomNavItem {
  myLoads,
  book,
  postLoad,
  request;

  String get iconPath {
    return switch (this) {
      myLoads => Assets.svgs.navMyLoadsIcon.path,
      book => Assets.svgs.navBookIcon.path,
      postLoad => Assets.svgs.navPostLoadIcon.path,
      request => Assets.svgs.navRequestIcon.path,
    };
  }

  bool get isMyLoads => this == BottomNavItem.myLoads;
  bool get isBook => this == BottomNavItem.book;
  bool get isPostLoad => this == BottomNavItem.postLoad;
  bool get isRequest => this == BottomNavItem.request;
}
