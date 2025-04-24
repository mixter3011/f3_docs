import 'package:f3_docs/features/docs/widgets/code_block.dart';
import 'package:f3_docs/features/docs/widgets/doc_link.dart';
import 'package:f3_docs/features/docs/widgets/doc_list.dart';
import 'package:f3_docs/features/docs/widgets/heading.dart';
import 'package:f3_docs/features/docs/widgets/paragraph.dart';
import 'package:f3_docs/features/docs/widgets/title.dart';
import 'package:flutter/material.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({super.key});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth >= 768;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DocTitle('Overview'),
          const DocParagraph(
            'The F3 CLI (Command Line Interface) is a powerful tool built with Go that helps you create and manage F3 Stack projects. It automates the setup process and provides commands for common tasks, allowing you to focus on building your application.',
          ),
          const DocHeading('Installation'),
          const DocParagraph('You can install the F3 CLI using Go:'),
          DocCodeBlock('''go install github.com/mixter3011/f3-stack@latest'''),
          const DocParagraph(
            'Make sure your Go bin directory is in your PATH to use the CLI globally.',
          ),
          const DocHeading('Creating a New Project'),
          const DocParagraph(
            'The primary function of the F3 CLI is to create new projects with all the necessary dependencies and boilerplate code:',
          ),
          const DocCodeBlock('''f3-stack create'''),
          const DocParagraph('When you run this command, the CLI will:'),
          const DocList([
            'Prompt you to enter your project name',
            'Create a new Flutter project with the specified name',
            'Add all the necessary dependencies to the pubspec.yaml file',
            'Set up the project structure following CLEAN Architecture principles',
            'Generate boilerplate code for authentication and basic functionality',
            'Configure shadcn_flutter for theming and UI components',
            'Set up dependency overrides for compatibility',
          ]),
          const DocHeading('Project Structure'),
          const DocParagraph(
            'The F3 CLI creates a project with the following structure:',
          ),
          const DocCodeBlock('''my_f3_app/
      ├── android/
      ├── ios/
      ├── lib/
      │   ├── core/
      │   │   ├── constants/
      │   │   ├── errors/
      │   │   ├── routes/
      │   │   ├── theme/
      │   │   └── utils/
      │   ├── data/
      │   │   ├── datasources/
      │   │   ├── models/
      │   │   └── repositories/
      │   ├── domain/
      │   │   ├── entities/
      │   │   ├── repositories/
      │   │   └── usecases/
      │   ├── presentation/
      │   │   ├── blocs/
      │   │   ├── pages/
      │   │   └── widgets/
      │   ├── firebase_options.dart
      │   └── main.dart
      ├── test/
      ├── pubspec.yaml
      └── README.md'''),
          const DocHeading('Dependencies'),
          const DocParagraph(
            'The F3 CLI adds the following dependencies to your project:',
          ),
          const DocList([
            'flutter_bloc: For state management',
            'firebase_core: For Firebase initialization',
            'firebase_auth: For authentication',
            'freezed: For immutable classes and pattern matching',
            'json_serializable: For JSON serialization',
            'get_it: For dependency injection',
            'shadcn_flutter: For theming and UI components',
          ]),
          const DocHeading('Firebase Integration'),
          const DocParagraph(
            'After creating your project with the F3 CLI, you need to connect it to Firebase using the FlutterFire CLI:',
          ),
          const DocCodeBlock('''
        # Install the FlutterFire CLI
        dart pub global activate flutterfire_cli

        # Navigate to your project directory  
        cd my_f3_app

        # Configure Firebase
        flutterfire configure
'''),
          const DocParagraph(
            'This will guide you through the process of selecting your Firebase project and configuring your app.',
          ),
          const DocHeading('Authentication'),
          const DocParagraph(
            'The F3 CLI sets up a complete authentication system with:',
          ),
          const DocList([
            'Login and registration screens',
            'Social authentication (Google)',
          ]),
          const DocParagraph(
            'All you need to do is connect your project to Firebase and enable the authentication providers you want to use in the Firebase Console.',
          ),
          const DocHeading('Theming'),
          const DocParagraph(
            'The F3 CLI sets up shadcn_flutter for theming and UI components. It provides a consistent look and feel for your application, with support for both light and dark modes.\n\nYou can customize the theme by modifying the files in the lib/core/theme directory.',
          ),
          const DocHeading('Next Steps'),
          const DocParagraph(
            'Now that you understand the F3 CLI, you can explore:',
          ),
          isWideScreen
              ? Column(
                children: [
                  Row(
                    children: [
                      DocLink('Dependency Overrides', '/docs/dependency'),
                      const Text(
                        ' - Learn about the dependency overrides used in F3 Stack',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      DocLink('Testing', '/docs/testing'),
                      const Text(
                        ' - Learn how to test your F3 Stack application',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      DocLink('Deployment', '/docs/deployment'),
                      const Text(
                        ' - Explore how to deploy your F3 Stack application',
                      ),
                    ],
                  ),
                ],
              )
              : Column(
                children: [
                  Row(
                    children: [
                      DocLink('Dependency Overrides', '/docs/dependency'),
                      const Text(
                        ' - Learn about the dependency overrides used in F3 Stack',
                        style: TextStyle(fontSize: 8),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      DocLink('Testing', '/docs/testing'),
                      const Text(
                        ' - Learn how to test your F3 Stack application',
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      DocLink('Deployment', '/docs/deployment'),
                      const Text(
                        ' - Explore how to deploy your F3 Stack application',
                        style: TextStyle(fontSize: 10),
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
