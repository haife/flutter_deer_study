// @since 2024/06/11
// @author 乌鸦
// @job Flutter Development
// @des:

import 'package:flutter/cupertino.dart';

class OrderPageProvider extends ChangeNotifier {
  int _index = 0;

  int get index => _index;

  void refresh() {
    notifyListeners();
  }

  void setIndex(int index) {
    _index = index;
    notifyListeners();
  }
}
