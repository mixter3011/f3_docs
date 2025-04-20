import 'package:f3_docs/features/docs/widgets/code_block.dart';
import 'package:f3_docs/features/docs/widgets/doc_link.dart';
import 'package:f3_docs/features/docs/widgets/doc_list.dart';
import 'package:f3_docs/features/docs/widgets/heading.dart';
import 'package:f3_docs/features/docs/widgets/paragraph.dart';
import 'package:f3_docs/features/docs/widgets/title.dart';
import 'package:flutter/material.dart';

class InstallationPage extends StatelessWidget {
  const InstallationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DocTitle('Installation'),
        const DocParagraph(
          'Getting started with F3 Stack is straightforward. This guide will walk you through the process of setting up your development environment and creating your first F3 Stack project.',
        ),

        const DocHeading('Prerequisites'),
        const DocParagraph(
          'Before you begin, make sure you have the following installed:',
        ),

        const DocList([
          'Flutter SDK (latest stable version)',
          'Dart SDK (included with Flutter)',
          'A code editor (VS Code, Android Studio, or IntelliJ IDEA)',
          'Git',
        ]),

        const DocHeading('Installing the F3 CLI'),
        const DocParagraph(
          'The F3 CLI is a command-line tool built with Go that helps you create and manage F3 Stack projects. You can install it using:',
        ),

        const DocCodeBlock('go install github.com/mixter3011/f3-stack@latest'),

        const DocParagraph(
          'Make sure your Go bin directory is in your PATH to use the CLI globally.',
        ),

        const DocHeading('Creating a New Project'),
        const DocParagraph(
          'Once you have the F3 CLI installed, you can create a new project by running:',
        ),

        const DocCodeBlock('f3-stack create'),

        const DocParagraph(
          'The CLI will prompt you to enter your project name and guide you through the setup process. It will create a new Flutter project with all the necessary dependencies and boilerplate code to get started with F3 Stack.',
        ),

        const DocHeading('Connecting to Firebase'),
        const DocParagraph(
          'After creating your project, you\'ll need to connect it to Firebase:',
        ),

        DocList([
          'Create a new project in the Firebase Console',
          'Install the Firebase CLI if you haven\'t already:',
        ]),
        DocCodeBlock('npm install -g firebase-tools'),
        DocList(['Install the FlutterFire CLI:'], isOrdered: true),
        DocCodeBlock('dart pub global activate flutterfire_cli'),
        DocList(['Navigate to your project directory and run:']),
        DocCodeBlock('flutterfire configure'),
        DocList([
          'Follow the prompts to select your Firebase project and configure your app',
        ]),
        const DocHeading('Running Your Project'),
        const DocParagraph(
          'Once your project is set up and connected to Firebase, you can run it using:',
        ),

        const DocCodeBlock('flutter run'),

        const DocParagraph(
          'This will launch your app on a connected device or emulator.',
        ),

        const DocHeading('Next Steps'),
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            children: [
              const DocParagraph('Check out the '),
              DocLink('Architecture', '/architecture'),
              const DocParagraph(
                ' guide to understand the structure of your project and how to build on it.',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
