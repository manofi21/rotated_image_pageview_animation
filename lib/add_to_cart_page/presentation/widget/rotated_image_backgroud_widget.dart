import 'package:flutter/material.dart';

import '../../utils/get_angel_value/get_angel_value.dart';

class RotatedImageBackgroundWidget extends StatefulWidget {
  const RotatedImageBackgroundWidget(
      {super.key,
      required this.currentIndex,
      required this.imageFood,
      required this.pageOffset});

  final int currentIndex;
  final String imageFood;
  final double pageOffset;

  @override
  State<RotatedImageBackgroundWidget> createState() => _RotatedImageBackgroundWidgetState();
}

class _RotatedImageBackgroundWidgetState extends State<RotatedImageBackgroundWidget> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final valueForRotatingBackground = GetValueForRotatingBackground(widget.currentIndex, widget.pageOffset);
    return Opacity(
      opacity: 0.2,
      child: Transform.rotate(
        angle: valueForRotatingBackground.calculateValueByPi(),
        child: SizedBox(
          width: size.width * 1.5,
          height: size.width * 1.5,
          child: Image.asset(
            widget.imageFood,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
