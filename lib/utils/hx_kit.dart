import 'dart:math';
import 'package:flutter/material.dart';

class HXKit {
  /// 上部padding
  static const double paddingTop = 30.0;
  /// 动画时间: 秒
  static const int durSec = 1;
  /// 正方形边长
  static const double squLen = 100.0;
  /// 长方形宽
  static const double recWidth = 150;
  /// 长方形高
  static const double recHeight = 80;


  final Random rand = Random.secure();

  Color randColor() {
    return Color.fromARGB(
        255, rand.nextInt(255), rand.nextInt(255), rand.nextInt(255));
  }

  /// <= 256
  int randInt() {
    return rand.nextInt(255);
  }

}
