import 'package:f3_docs/features/docs/widgets/doc_link.dart';
import 'package:f3_docs/features/docs/widgets/feature_card.dart';
import 'package:f3_docs/features/docs/widgets/heading.dart';
import 'package:f3_docs/features/docs/widgets/paragraph.dart';
import 'package:f3_docs/features/docs/widgets/sub_heading.dart';
import 'package:f3_docs/features/docs/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth >= 768;
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DocTitle('Introduction'),

            const DocParagraph(
              'F3 Stack is a modern Flutter development stack that combines Flutter, Firebase, and Freezed to provide a robust foundation for building full-stack, type-safe applications. It\'s designed to be the Flutter equivalent of the popular t3 stack in the React ecosystem.',
            ),
            const DocHeading('What is F3 Stack?'),
            const DocParagraph(
              'F3 Stack is a collection of tools, libraries, and best practices that work together to provide a seamless development experience for Flutter applications. It emphasizes type safety, modularity, and follows CLEAN Architecture principles to help developers build maintainable and scalable applications.',
            ),

            const DocSubheading('Core Components'),

            const SizedBox(height: 16),
            Text('• Flutter', style: ShadTheme.of(context).textTheme.h4),
            const DocParagraph(
              'Google\'s UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase. Flutter provides the foundation for building responsive and visually appealing user interfaces.',
            ),

            Text('• Firebase', style: ShadTheme.of(context).textTheme.h4),
            const DocParagraph(
              'Google\'s platform for building mobile and web applications. F3 Stack includes pre-configured Firebase Authentication to get you started quickly with user management. The stack provides the foundation for you to easily integrate other Firebase services as needed for your specific application.',
            ),

            Text('• Freezed', style: ShadTheme.of(context).textTheme.h4),
            const DocParagraph(
              'A code generation package for Dart that provides immutable classes with unions/pattern-matching/copy capabilities. Freezed ensures type safety and helps prevent runtime errors by catching issues at compile time.',
            ),

            const DocHeading('Why F3 Stack?'),

            const SizedBox(height: 16),
            Column(
              children: [
                FeatureCard(
                  title: 'Modular Code Structure',
                  description:
                      'F3 Stack provides a modular code structure following CLEAN Architecture principles, making it easier to organize and maintain your codebase as it grows.',
                ),
                const SizedBox(height: 12),
                FeatureCard(
                  title: 'Type Safety',
                  description:
                      'With Freezed, you get compile-time type checking, reducing the likelihood of runtime errors and making your code more robust.',
                ),
                const SizedBox(height: 12),
                FeatureCard(
                  title: 'Rapid Development',
                  description:
                      'The F3 CLI tool allows you to quickly scaffold new projects with all the necessary dependencies and boilerplate code, so you can focus on building features.',
                ),
                const SizedBox(height: 12),
                FeatureCard(
                  title: 'Beautiful UI',
                  description:
                      'F3 Stack includes shadcn_flutter for theming and custom components for better UI/UX, giving your applications a professional look out of the box.',
                ),
              ],
            ),

            const DocHeading('Getting Started'),
            isWideScreen
                ? Row(
                  children: [
                    const DocParagraph(
                      'Ready to start building with F3 Stack? Check out the ',
                    ),
                    DocLink('Installation', '/installation'),
                    const DocParagraph(
                      ' guide to set up your development environment.',
                    ),
                  ],
                )
                : Column(
                  children: [
                    const Text('Ready to start building with F3 Stack? '),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        const Text(
                          'Check out the ',
                          style: TextStyle(fontSize: 10),
                        ),
                        DocLink('Installation', '/installation'),
                        const Text(
                          ' guide to set up your development environment.',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
          ],
        ),
      ],
    );
  }
}
