import 'package:diesel_powered/util/resources/r.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({required String msg}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    textColor: R.colors.white,
    backgroundColor: R.colors.primary,
  );
}
