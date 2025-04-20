import 'package:f3_docs/features/docs/screens/intro.dart';
import 'package:f3_docs/features/docs/widgets/doc_sidebar.dart';
import 'package:flutter/material.dart';

export 'package:f3_docs/features/docs/screens/firebase.dart';
export 'package:f3_docs/features/docs/screens/flutter.dart';
export 'package:f3_docs/features/docs/screens/freezed.dart';
export 'package:f3_docs/features/docs/screens/installation.dart';
export 'package:f3_docs/features/docs/screens/intro.dart';

class DocsPage extends StatelessWidget {
  const DocsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const DocsSidebar(),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 768),
                  child: const IntroductionPage(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
