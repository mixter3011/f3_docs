import 'package:f3_docs/features/docs/widgets/doc_sidebar.dart';
import 'package:flutter/material.dart';

class DocsLayout extends StatelessWidget {
  final Widget child;

  const DocsLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const DocsSidebar(),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.only(
                    left: 40,
                    right: 40,
                    top: 20,
                    bottom: 40,
                  ),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 1000,
                        minHeight: constraints.maxHeight - 60,
                      ),
                      child: child,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
