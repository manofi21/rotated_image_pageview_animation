import 'dart:math';

double getScaleForRotatedImage(
  double currentOffset,
  int currentIndex,
) {
  double vp = 1;
  double scale = max(vp, (currentOffset - currentIndex).abs());
  return scale;
}
