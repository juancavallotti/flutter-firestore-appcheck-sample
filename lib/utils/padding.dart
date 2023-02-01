import 'package:flutter/material.dart';

extension QuickPadding on Widget {
  Widget padding(
      {double? all,
      double top = 0,
      double bottom = 0,
      double left = 0,
      double right = 0}) {
    EdgeInsets insets = (all != null)
        ? EdgeInsets.all(all)
        : EdgeInsets.only(bottom: bottom, top: top, left: left, right: right);

    return Padding(
      padding: insets,
      child: this,
    );
  }
}
