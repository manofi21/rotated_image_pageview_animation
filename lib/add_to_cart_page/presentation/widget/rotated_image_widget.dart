import 'package:flutter/material.dart';
import 'package:rotated_image_pageview_animation/add_to_cart_page/utils/get_angel_value/get_angel_value.dart';

import '../../utils/function/get_scale_for_rotated_image.dart';

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
        final rotatedImageValue = GetValueForRotatingImage(index, widget.pageController);

        return Transform.rotate(
          angle: rotatedImageValue.calculateValueByPi(),
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
