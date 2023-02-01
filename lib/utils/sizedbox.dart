import 'package:flutter/material.dart';

extension QuickSizedBox on Widget {
  Widget sizedBox({double? width, double? height}) {
    return SizedBox(
      width: width,
      height: height,
      child: this,
    );
  }

  Widget boxExpand() {
    return SizedBox.expand(
      child: this,
    );
  }
}
