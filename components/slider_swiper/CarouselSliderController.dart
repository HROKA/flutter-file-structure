import 'package:get/get.dart';

import '../index.dart';

class CarouselSliderController extends GetxController {
  int current = 0;

  onPageUpdated(index, reason) {
    current = index;
    update();
  }
}
