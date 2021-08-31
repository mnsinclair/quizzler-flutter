import 'package:flutter/material.dart';

class Scorekeeper {
  List<Icon> _scoreWidgets = [];

  void addResult({bool answer, bool response}) {
    Icon icon;
    if (response == answer) {
      icon = Icon(
        Icons.check,
        color: Colors.green,
      );
    } else {
      icon = Icon(
        Icons.close,
        color: Colors.red,
      );
    }
    _scoreWidgets.add(icon);
  }

  get scoreWidgets {
    return _scoreWidgets;
  }

}