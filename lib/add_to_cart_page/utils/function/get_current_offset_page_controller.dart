  import 'package:flutter/material.dart';

double getCurrentOffsetPageController(PageController pageController) {
    bool inited = pageController.hasClients &&
        pageController.position.hasContentDimensions;
    return inited ? pageController.page! : pageController.initialPage * 1.0;
  }