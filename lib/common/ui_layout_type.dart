import 'package:flutter/foundation.dart';

abstract class HasLayoutGroup {
  VoidCallback get onLayoutToggle;
}

enum LayoutType {
  rowCol,
  stack
}

String layoutName(LayoutType layoutType) {
  switch (layoutType) {
    case LayoutType.rowCol:
      return 'Row / Col';
    case LayoutType.stack:
      return 'Stack';
  }
}