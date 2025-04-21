import 'package:flutter/material.dart';

class RouteNotifier extends ChangeNotifier {
  String _currentPath = '';

  String get currentPath => _currentPath;

  void updatePath(String path) {
    if (_currentPath != path) {
      _currentPath = path;
      notifyListeners();
    }
  }
}
