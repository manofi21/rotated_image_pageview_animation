import 'package:flutter/material.dart';

import '../function/get_scale_for_rotated_image.dart';
import '../get_angel_value/get_angel_value.dart';

class RotatedImageInterface extends GetValueForRotatingImage {
  final double currentOffset;
  RotatedImageInterface({
    required int currentPage,
    required PageController pageController,
    required this.currentOffset,
  }) : super(currentPage, pageController);

  double getBottomPaddingImage() {
    double scaleImage = getScaleForRotatedImage(currentOffset, currentPage);
    return 200 - scaleImage * 5;
  }
}
