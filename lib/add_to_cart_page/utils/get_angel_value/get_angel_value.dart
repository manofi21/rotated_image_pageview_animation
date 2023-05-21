import 'dart:math';

import 'package:flutter/material.dart';

import '../function/get_value_for_rotating_image.dart';

abstract class GetAngelValue {
  int currentPage;

  GetAngelValue(this.currentPage);
  double calculateValueByPi();
}

class GetValueForRotatingImage extends GetAngelValue {
  final PageController pageController;
  GetValueForRotatingImage(super.currentPage, this.pageController);

  @override
  double calculateValueByPi() {
    final valueForRotatingImage = getValueForRotatingImage(currentPage, pageController);
    return pi * valueForRotatingImage;
  }
}

class GetValueForRotatingBackground extends GetAngelValue {
  final double pageOffset;
  GetValueForRotatingBackground(super.currentPage, this.pageOffset);

  @override
  double calculateValueByPi() {
    final absValue = (pageOffset - currentPage).abs();
    return pi * (pi * absValue) + (pi / 180);
  }
}