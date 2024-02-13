import 'dart:async';

import 'package:get/get.dart';

class OtpTimeDecreaseController extends GetxController {
  int _seconds = 120;

  get seconds => _seconds;

  void decreaseTime() {
    Timer.periodic(const Duration(seconds: 1), (_) {
      if (_seconds > 0) {
        _seconds--;
        update();
      }
    });
  }
}
