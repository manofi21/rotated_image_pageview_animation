import 'dart:math';
import 'package:flutter/material.dart';

import '../../utils/function/get_scale_for_rotated_image.dart';
import '../../utils/function/get_value_for_rotating_image.dart';

class RotatedImageWidget extends StatefulWidget {
  final PageController pageController;
  final String Function(int index) image;
  final double currentOffset;
  const RotatedImageWidget({
    super.key,
    required this.pageController,
    required this.image,
    required this.currentOffset,
  });

  @override
  State<RotatedImageWidget> createState() => _RotatedImageWidgetState();
}

class _RotatedImageWidgetState extends State<RotatedImageWidget> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: widget.pageController,
      itemBuilder: (context, index) {
        double scaleImage = getScaleForRotatedImage(widget.currentOffset, index);
        double rotatedImageValue = getValueForRotatingImage(index, widget.pageController);

        return Transform.rotate(
          angle: pi * rotatedImageValue,
          child: Padding(
            padding: EdgeInsets.only(bottom: 200 - scaleImage * 5),
            child: FittedBox(
              child: Image.asset(
                widget.image(index),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
