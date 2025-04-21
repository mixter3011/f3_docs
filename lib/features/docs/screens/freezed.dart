import 'package:f3_docs/features/docs/widgets/code_block.dart';
import 'package:f3_docs/features/docs/widgets/doc_link.dart';
import 'package:f3_docs/features/docs/widgets/doc_list.dart';
import 'package:f3_docs/features/docs/widgets/heading.dart';
import 'package:f3_docs/features/docs/widgets/paragraph.dart';
import 'package:f3_docs/features/docs/widgets/sub_heading.dart';
import 'package:f3_docs/features/docs/widgets/title.dart';
import 'package:flutter/material.dart';

class FreezedPage extends StatelessWidget {
  const FreezedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DocTitle('Freezed'),
        const DocParagraph(
          'Freezed is a code generation package for Dart that provides immutable classes with unions/pattern-matching/copy capabilities. In F3 Stack, Freezed is used to ensure type safety and create robust data models.',
        ),

        const DocHeading('Why Freezed?'),
        const DocParagraph(
          'Freezed offers several advantages that make it an essential part of the F3 Stack:',
        ),

        const DocList([
          'Immutability: Creates immutable data classes, reducing bugs related to unexpected state changes.',
          'Pattern matching: Provides a type-safe way to handle different states of a class.',
          'Copy with: Easily create copies of objects with modified properties.',
          'JSON serialization: Seamlessly integrates with json_serializable for easy JSON conversion.',
          'Equality comparisons: Automatically implements equality based on the object\'s properties.',
        ]),

        const DocHeading('Freezed in F3 Stack'),
        const DocParagraph('In F3 Stack, Freezed is used for:'),

        const DocList([
          'Data models that represent entities from your domain',
          'State classes for BLoCs and other state management solutions',
          'Event classes that represent user interactions',
          'Error handling with union types',
        ]),

        const DocSubheading('Data Models'),
        const DocParagraph(
          'Freezed is used to create immutable data models that represent your application\'s entities:',
        ),

        const DocCodeBlock('''
// Example of a Freezed data model in F3 Stack\n
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _\$User {
  const factory User({
    required String id,
    required String name,
    required String email,
    String? photoUrl,
    @Default(false) bool isAdmin,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _\$UserFromJson(json);
}
'''),
        const DocSubheading('State Management'),
        const DocParagraph(
          'Freezed is used to create state classes for BLoCs and other state management solutions:',
        ),

        const DocCodeBlock('''
// Example of a Freezed state class in F3 Stack\n
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _\$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated(User user) = _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.error(String message) = _Error;
}
'''),

        const DocSubheading('Pattern Matching'),
        const DocParagraph(
          'Freezed provides pattern matching capabilities that allow you to handle different states in a type-safe way:',
        ),

        const DocCodeBlock('''
// Example of pattern matching with Freezed in F3 Stack
Widget build(BuildContext context) {
  return BlocBuilder<AuthBloc, AuthState>(
    builder: (context, state) {
      return state.map(
        initial: (_) => const SplashScreen(),
        loading: (_) => const LoadingScreen(),
        authenticated: (state) => HomeScreen(user: state.user),
        unauthenticated: (_) => const LoginScreen(),
        error: (state) => ErrorScreen(message: state.message),
      );
    },
  );
}
'''),

        const DocSubheading('Copy With'),
        const DocParagraph(
          'Freezed generates a copyWith method that allows you to create copies of objects with modified properties:',
        ),

        const DocCodeBlock('''
// Example of copyWith with Freezed in F3 Stack
final user = User(
  id: '123',
  name: 'John Doe',
  email: 'john@example.com',
);

// Create a copy with a different name
final updatedUser = user.copyWith(name: 'Jane Doe');

// updatedUser is a new object with id: '123', name: 'Jane Doe', email: 'john@example.com'
'''),

        const DocHeading('Dependency Overrides'),
        const DocParagraph(
          'F3 Stack uses a dependency override for the analyzer package to ensure compatibility with json_serializable and freezed:',
        ),

        const DocCodeBlock('''
// Example of dependency override in pubspec.yaml
dependency_overrides:
  analyzer: '6.2.0'
'''),

        const DocParagraph(
          'This ensures that the code generation works correctly and avoids compatibility issues between different packages.',
        ),

        const DocHeading('Best Practices'),
        const DocParagraph(
          'When working with Freezed in F3 Stack, follow these best practices:',
        ),

        const DocList([
          'Use Freezed for all data models: Ensure consistency and type safety throughout your application.',
          'Leverage pattern matching: Use the map, maybeMap, and when methods for handling different states.',
          'Run build_runner after changes: Remember to run flutter pub run build_runner build after modifying Freezed classes.',
          'Use default values: Provide default values for optional parameters to make your code more robust.',
          'Combine with json_serializable: Use both packages together for seamless JSON serialization.',
        ]),

        const DocHeading('Next Steps'),
        Row(
          children: [
            const DocParagraph('Check out the '),
            DocLink('Dependency Overrides', '/dependency'),
            const DocParagraph(' guide to learn about the advanced stuff.'),
          ],
        ),
      ],
    );
  }
}
