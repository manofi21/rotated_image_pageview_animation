import 'package:flutter/material.dart';

double getValueForRotatingImage(int currentIndex, PageController pageController) {
  double value = 0.0;
  if (pageController.position.haveDimensions) {
    value = currentIndex.toDouble() - (pageController.page ?? 0);
    value = (value * 2).clamp(-1, 1);
  }
  return value;
}

/// Note: tanpa dan mengalikan 0.7 tidak ada perbedaan. 