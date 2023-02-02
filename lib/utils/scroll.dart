import 'package:flutter/material.dart';

extension QuickScroll on Widget {
  Widget scroll() {
    return Scrollbar(child: this);
  }
}
