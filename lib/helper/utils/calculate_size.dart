import 'dart:ui';

double calculateSize(double initial) {
  return initial / 414 * window.physicalSize.width;
}