import 'package:f3_docs/features/docs/screens/docs.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String docs = '/docs';
  static const String introduction = '/docs/introduction';
  static const String installation = '/docs/installation';
  static const String flutter = '/docs/flutter';
  static const String firebase = '/docs/firebase';
  static const String freezed = '/docs/freezed';
  static const String faq = '/docs/faq';

  static Map<String, Widget Function(BuildContext)> get routes => {
    docs: (context) => const DocsPage(),
    introduction: (context) => const Placeholder(),
    installation: (context) => const Placeholder(),
    flutter: (context) => const Placeholder(),
    firebase: (context) => const Placeholder(),
    freezed: (context) => const Placeholder(),
    faq: (context) => const Placeholder(),
  };
}
