import 'package:flutter/cupertino.dart';

class AnimatedSwitchController extends ChangeNotifier {
  int currentIndex = 0;

  set index(int index) {
    // to avoid building the ui unnecessary
    if (currentIndex != index) {
      currentIndex = index;
      notifyListeners();
    }
  }

  int get index => currentIndex;
}
