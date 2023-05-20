import 'dart:math';

import 'package:flutter/material.dart';

class BgImage extends StatefulWidget {
  const BgImage(
      {super.key,
      required this.currentIndex,
      required this.imageFood,
      required this.pageOffset});

  final int currentIndex;
  final String imageFood;
  final double pageOffset;

  @override
  State<BgImage> createState() => _BgImageState();
}

class _BgImageState extends State<BgImage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    double value = (widget.pageOffset - widget.currentIndex).abs();
    return Opacity(
      opacity: 0.2,
      child: Transform.rotate(
        angle: (pi * value) + (pi / 180),
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
