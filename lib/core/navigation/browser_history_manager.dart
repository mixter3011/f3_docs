import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

class BrowserHistoryManager {
  final GoRouter router;

  BrowserHistoryManager(this.router) {
    if (kIsWeb) {
      SystemChannels.navigation.setMethodCallHandler((MethodCall call) async {
        if (call.method == 'popRoute') {
          return false;
        }
        return false;
      });
    }
  }
}
