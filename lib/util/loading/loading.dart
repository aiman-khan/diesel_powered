import 'package:calculator_flutter_app/common/widgets/loading_widget.dart';
import 'package:calculator_flutter_app/util/resources/r.dart';
import 'package:flutter/material.dart';

OverlayEntry? _overlayEntry;

void loading(BuildContext context) {
  if (_overlayEntry != null) return;
  _overlayEntry = OverlayEntry(
    builder: (context) => Container(
      color: R.colors.white.withOpacity(0.5),
      child: Center(
        child: SpinKitDoubleBounce(color: R.colors.primary),
      ),
    ),
  );

  Overlay.of(context).insert(_overlayEntry!);
}

void dismissLoading() {
  if (_overlayEntry == null) return;
  _overlayEntry?.remove();
  _overlayEntry = null;
}
