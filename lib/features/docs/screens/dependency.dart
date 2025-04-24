import 'package:f3_docs/features/docs/widgets/code_block.dart';
import 'package:f3_docs/features/docs/widgets/doc_link.dart';
import 'package:f3_docs/features/docs/widgets/doc_list.dart';
import 'package:f3_docs/features/docs/widgets/heading.dart';
import 'package:f3_docs/features/docs/widgets/paragraph.dart';
import 'package:f3_docs/features/docs/widgets/sub_heading.dart';
import 'package:f3_docs/features/docs/widgets/title.dart';
import 'package:flutter/material.dart';

class DependencyPage extends StatefulWidget {
  const DependencyPage({super.key});

  @override
  State<DependencyPage> createState() => _DependencyPageState();
}

class _DependencyPageState extends State<DependencyPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth >= 768;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DocTitle('Dependency Overrides'),
          const DocParagraph(
            'F3 Stack uses dependency overrides to ensure compatibility between different packages, particularly for the analyzer package which is critical for code generation with Freezed and json_serializable.',
          ),
          const DocHeading('Why Dependency Overrides?'),
          const DocParagraph(
            'In Dart and Flutter development, sometimes packages have conflicting dependencies or require specific versions of other packages to work correctly. Dependency overrides allow you to specify exactly which version of a package should be used, regardless of what other packages request.\n\nIn F3 Stack, we use dependency overrides primarily to ensure that the code generation tools work correctly with each other.',
          ),
          const DocHeading('Analyzer Override'),
          const DocParagraph(
            'The most important dependency override in F3 Stack is for the analyzer package:',
          ),
          const DocCodeBlock('''
# In pubspec.yaml
    dependency_overrides:
      analyzer: '6.2.0' '''),
          const DocParagraph(
            'This override ensures that version 6.2.0 of the analyzer package is used, which is known to work well with the json_serializable and freezed packages. Without this override, you might encounter errors during code generation.',
          ),
          const DocSubheading('Why Version 6.2.0?'),
          const DocParagraph(
            'Version 6.2.0 of the analyzer package has been tested and confirmed to work well with the specific versions of freezed and json_serializable used in F3 Stack. It provides the right balance of features and stability.',
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color:
                  Theme.of(context).brightness == Brightness.dark
                      ? const Color(0xFF1F2937)
                      : const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const DocSubheading('Note'),
                const DocParagraph(
                  'In future versions of F3 Stack, we plan to update the dependency overrides to use newer versions of packages as they become compatible with each other. This will ensure that F3 Stack stays up-to-date with the latest improvements in the Flutter ecosystem.',
                ),
              ],
            ),
          ),
          const DocHeading('Other Potential Overrides'),
          const DocParagraph(
            'Depending on your project\ts specific needs, you might need to add other dependency overrides. The F3 CLI automatically adds the necessary overrides when creating a new project, but if you\tre adding new packages, you might need to adjust them.\n\mCommon packages that might require overrides include:',
          ),
          const DocList([
            'build_runner: The tool that runs code generators.',
            'source_gen: A framework for writing code generators.',
            'json_serializable: A library for JSON serialization.',
            'freezed: A code generation package for immutable classes.',
          ]),
          const DocHeading('Adding Custom Overrides'),
          const DocParagraph(
            'If you need to add custom dependency overrides to your F3 Stack project, you can do so in the pubspec.yaml file:',
          ),
          const DocCodeBlock('''
# In pubspec.yaml
    dependency_overrides:
      analyzer: '6.2.0'
# Add your custom overrides here
      some_package: '1.2.3' '''),
          const DocParagraph(
            'Be careful when adding custom overrides, as they can potentially cause conflicts with other packages. Always test your application thoroughly after adding new overrides.',
          ),
          const DocHeading('Troubleshooting'),
          const DocParagraph(
            'If you encounter issues with dependency conflicts or code generation, here are some steps to troubleshoot:',
          ),
          const DocList([
            'Run flutter pub get to update dependencies.',
            'Delete the .dart_tool directory to clear the cache.',
            'Run flutter clean to clean the build.',
            'Run flutter pub run build_runner clean to clean generated files.',
            'Run flutter pub run build_runner build --delete-conflicting-outputs to regenerate files.',
          ]),
          const DocHeading('Next Steps'),
          const DocParagraph(
            'Now that you understand dependency overrides in F3 Stack, you can explore:',
          ),
          isWideScreen
              ? Column(
                children: [
                  Row(
                    children: [
                      DocLink('Testing', '/docs/testing'),
                      const Text(
                        ' - Learn how to test your F3 Stack application',
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      DocLink('Deployment', '/docs/deployment'),
                      const Text(
                        ' - Explore how to deploy your F3 Stack application',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      DocLink('CLI', '/docs/overview'),
                      const Text(
                        ' - Learn more about the F3 CLI and how it manages dependencies',
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                ],
              )
              : Column(
                children: [
                  Row(
                    children: [
                      DocLink('Testing', '/docs/testing'),
                      const Text(
                        ' - Learn how to test your F3 Stack application',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      DocLink('Deployment', '/docs/deployment'),
                      const Text(
                        ' - Explore how to deploy your F3 Stack application',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      DocLink('CLI', '/docs/overview'),
                      const Text(
                        ' - Learn more about the F3 CLI and how it manages dependencies',
                        style: TextStyle(fontSize: 10.5),
                      ),
                    ],
                  ),
                ],
              ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
