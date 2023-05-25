import 'package:flutter/cupertino.dart';

class PageProvider extends ChangeNotifier {
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;
  void changePageIndex(int index) {
    _pageIndex = index;
    notifyListeners();
  }
}
