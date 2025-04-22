import 'package:f3_docs/features/docs/widgets/code_block.dart';
import 'package:f3_docs/features/docs/widgets/doc_link.dart';
import 'package:f3_docs/features/docs/widgets/doc_list.dart';
import 'package:f3_docs/features/docs/widgets/heading.dart';
import 'package:f3_docs/features/docs/widgets/paragraph.dart';
import 'package:f3_docs/features/docs/widgets/sub_heading.dart';
import 'package:f3_docs/features/docs/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ArchitecturePage extends StatelessWidget {
  const ArchitecturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DocTitle('Architecture'),
              const DocParagraph(
                'F3 Stack follows the CLEAN Architecture pattern, which promotes separation of concerns and modularity. This '
                'architecture makes your code more maintainable, testable, and scalable.',
              ),
              const DocHeading('Project Structure'),
              const DocParagraph(
                'When you create a new F3 Stack project, it will have the following structure:',
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

              const DocHeading('CLEAN Architecture Layers'),
              const DocSubheading('Domain Layer'),
              const DocParagraph(
                'The domain layer is the core of your application. It contains business logic and is independent of any '
                'external frameworks or libraries.',
              ),
              const DocList([
                'Entities: Business objects that represent your application\'s data structures.',
                'Repositories: Interfaces that define how to interact with your data sources.',
                'Use Cases: Business logic operations that can be performed in your application.',
              ]),

              const DocSubheading('Data Layer'),
              const DocParagraph(
                'The data layer is responsible for retrieving and storing data. It implements the repository interfaces '
                'defined in the domain layer.',
              ),
              const DocList([
                'Data Sources: Classes that interact with external data sources like Firebase, APIs, or local storage.',
                'Models: Data classes that implement the entities from the domain layer, often using Freezed for immutability.',
                'Repositories: Implementations of the repository interfaces from the domain layer.',
              ]),

              const DocSubheading('Presentation Layer'),
              const DocParagraph(
                'The presentation layer is responsible for displaying data to the user and handling user interactions.',
              ),
              const DocList([
                'Blocs: Business Logic Components that manage the state of your UI.',
                'Pages: Full screens in your application.',
                'Widgets: Reusable UI components.',
              ]),

              const DocHeading('Core'),
              const DocParagraph(
                'The core directory contains utilities, constants, and other shared resources used throughout your '
                'application.',
              ),
              const DocList([
                'Constants: Application-wide constants.',
                'Errors: Custom error classes and error handling utilities.',
                'Routes: Navigation routes and route management.',
                'Theme: Application theme and styling.',
                'Utils: Utility functions and extensions.',
              ]),

              const DocHeading('Dependency Flow'),
              const DocParagraph(
                'In CLEAN Architecture, dependencies flow from the outer layers to the inner layers. This means that:',
              ),
              const DocList([
                'The domain layer has no dependencies on other layers.',
                'The data layer depends on the domain layer.',
                'The presentation layer depends on the domain layer and sometimes on the data layer.',
              ]),

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
                    const DocSubheading('Dependency Injection'),
                    const DocParagraph(
                      'F3 Stack uses dependency injection to manage dependencies between layers. This makes your code more testable '
                      'and maintainable by decoupling the creation of objects from their usage.',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: RichText(
                        text: TextSpan(
                          style: DefaultTextStyle.of(context).style,
                          children: [
                            const TextSpan(text: 'The '),
                            TextSpan(
                              text: 'get_it',
                              style: ShadTheme.of(context).textTheme.muted,
                            ),
                            const TextSpan(
                              text:
                                  ' package is used for service locator pattern implementation, allowing you to register and retrieve '
                                  'dependencies throughout your application.',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const DocHeading('Next Steps'),
              const DocParagraph(
                'Now that you understand the architecture of F3 Stack, you can explore the individual components:',
              ),
              Row(
                children: [
                  DocLink('Flutter', '/docs/flutter'),
                  const Text(' - Learn about how Flutter is used in F3 Stack'),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  DocLink('Firebase', '/docs/firebase'),
                  const Text(' - Understand how Firebase is integrated'),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  DocLink('Freezed', '/docs/freezed'),
                  const Text(' - Explore how Freezed provides type safety'),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }
}
