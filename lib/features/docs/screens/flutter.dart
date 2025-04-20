import 'package:f3_docs/features/docs/widgets/doc_list.dart';
import 'package:f3_docs/features/docs/widgets/heading.dart';
import 'package:f3_docs/features/docs/widgets/paragraph.dart';
import 'package:f3_docs/features/docs/widgets/sub_heading.dart';
import 'package:f3_docs/features/docs/widgets/title.dart';
import 'package:flutter/material.dart';

class FlutterPage extends StatelessWidget {
  const FlutterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DocTitle('Flutter'),
        const DocParagraph(
          'Flutter is the UI toolkit that forms the foundation of the F3 Stack. It allows you to build beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.',
        ),

        const DocHeading('Why Flutter?'),
        const DocParagraph(
          'Flutter offers several advantages that make it an ideal choice for modern application development:',
        ),

        const DocList([
          'Cross-platform: Build for iOS, Android, web, and desktop from a single codebase.',
          'Fast development: Hot reload allows you to see changes instantly without losing state.',
          'Expressive UI: Create custom, animated UIs with a rich set of widgets.',
          'Native performance: Flutter compiles to native code for each platform, ensuring high performance.',
          'Strong community: A growing ecosystem of packages and plugins.',
        ]),

        const DocHeading('Flutter in F3 Stack'),
        const DocParagraph(
          'In F3 Stack, Flutter is used with a focus on modular, maintainable code. The project structure follows CLEAN Architecture principles, with clear separation between UI, business logic, and data access.',
        ),

        const DocSubheading('Widget Organization'),
        const DocParagraph('Widgets in F3 Stack are organized into:'),

        const DocList([
          'Pages: Full screens in your application, located in lib/presentation/pages.',
          'Widgets: Reusable UI components, located in lib/presentation/widgets.',
          'Custom Components: Enhanced UI components built on top of basic Flutter widgets, providing a consistent look and feel.',
        ]),
      ],
    );
  }
}
