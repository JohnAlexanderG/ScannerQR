import 'package:flutter/material.dart';

class UIProvider extends ChangeNotifier {
  int _selectedMenuOpt = 1;

  int get selectedMenuOpt {
    return this._selectedMenuOpt;
  }

  set setSelectedMenuOpt(int i) {
    this._selectedMenuOpt = i;
    notifyListeners();
  }
}
