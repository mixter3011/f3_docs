import 'package:f3_docs/features/docs/widgets/code_block.dart';
import 'package:f3_docs/features/docs/widgets/doc_link.dart';
import 'package:f3_docs/features/docs/widgets/doc_list.dart';
import 'package:f3_docs/features/docs/widgets/heading.dart';
import 'package:f3_docs/features/docs/widgets/paragraph.dart';
import 'package:f3_docs/features/docs/widgets/title.dart';
import 'package:flutter/material.dart';

class TestingPage extends StatefulWidget {
  const TestingPage({super.key});

  @override
  State<TestingPage> createState() => _TestingPageState();
}

class _TestingPageState extends State<TestingPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth >= 768;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DocTitle('Testing'),
          const DocParagraph(
            'Testing is a crucial part of building reliable applications. F3 Stack provides a structured approach to testing that aligns with its CLEAN Architecture principles, making it easier to write comprehensive tests for your application.',
          ),
          const DocHeading('Testing Strategy'),
          const DocParagraph(
            'F3 Stack encourages a comprehensive testing strategy that includes:',
          ),
          const DocList([
            'Unit Tests: Testing individual functions, methods, and classes in isolation.',
            'Widget Tests: Testing UI components to ensure they render correctly and respond to interactions.',
            'Integration Tests: Testing how different parts of the application work together.',
            'Golden Tests: Visual regression testing to ensure UI components look as expected.',
          ]),
          const DocHeading('Testing Tools'),
          const DocParagraph('F3 Stack uses the following testing tools:'),
          const DocList([
            'flutter_test: Flutter\ts built-in testing framework for unit and widget tests.',
            'mockito: A mocking framework for creating test doubles.',
            'bloc_test: A testing library for testing BLoCs.',
            'integration_test: Flutter\ts framework for integration tests.',
            'golden_toolkit: A package for golden tests.',
          ]),
          const DocHeading('Unit Testing'),
          const DocParagraph(
            'Unit tests focus on testing individual units of code in isolation. In F3 Stack, this typically means testing:',
          ),
          const DocList([
            'Use cases in the domain layer',
            'Repository implementations in the data layer',
            'BLoCs in the presentation layer',
            'Utility functions and extensions',
          ]),
          const DocCodeBlock('''
// Example of a unit test for a use case
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_f3_app/domain/repositories/user_repository.dart';
import 'package:my_f3_app/domain/usecases/get_user.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late GetUser useCase;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    useCase = GetUser(mockUserRepository);
  });

  test('should get user from repository', () async {
    // Arrange
    final user = User(id: '123', name: 'Test User', email: 'test@example.com');
    when(mockUserRepository.getUser('123')).thenAnswer((_) async => user);

    // Act
    final result = await useCase(userId: '123');

    // Assert
    expect(result, user);
    verify(mockUserRepository.getUser('123'));
    verifyNoMoreInteractions(mockUserRepository);
  });
}
'''),
          const DocHeading('Widget Testing'),
          const DocParagraph(
            'Widget tests focus on testing UI components to ensure they render correctly and respond to interactions. In F3 Stack, this typically means testing:',
          ),
          const DocList(['Custom widgets', 'Pages', 'Forms', 'Navigation']),
          const DocCodeBlock('''
// Example of a widget test for a login form
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_f3_app/presentation/widgets/login_form.dart';

void main() {
  testWidgets('LoginForm submits when valid', (WidgetTester tester) async {
    // Arrange
    bool formSubmitted = false;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LoginForm(
            onSubmit: (email, password) {
              formSubmitted = true;
            },
          ),
        ),
      ),
    );

    // Act
    await tester.enterText(find.byType(TextFormField).at(0), 'test@example.com');
    await tester.enterText(find.byType(TextFormField).at(1), 'password123');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Assert
    expect(formSubmitted, true);
  });
}
'''),
          const DocHeading('BLoC Testing'),
          const DocParagraph(
            'BLoC tests focus on testing the business logic components that manage state in your application. F3 Stack uses the bloc_test package to make testing BLoCs easier:',
          ),
          const DocCodeBlock('''
// Example of a BLoC test
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_f3_app/domain/usecases/sign_in.dart';
import 'package:my_f3_app/presentation/blocs/auth/auth_bloc.dart';

class MockSignIn extends Mock implements SignIn {}

void main() {
  late AuthBloc authBloc;
  late MockSignIn mockSignIn;

  setUp(() {
    mockSignIn = MockSignIn();
    authBloc = AuthBloc(signIn: mockSignIn);
  });

  tearDown(() {
    authBloc.close();
  });

  test('initial state is AuthInitial', () {
    expect(authBloc.state, const AuthState.initial());
  });

  blocTest<AuthBloc, AuthState>(
    'emits [loading, authenticated] when SignIn is successful',
    build: () {
      when(mockSignIn(email: 'test@example.com', password: 'password123'))
          .thenAnswer((_) async => User(id: '123', name: 'Test User', email: 'test@example.com'));
      return authBloc;
    },
    act: (bloc) => bloc.add(const AuthEvent.signIn(
      email: 'test@example.com',
      password: 'password123',
    )),
    expect: () => [
      const AuthState.loading(),
      AuthState.authenticated(User(id: '123', name: 'Test User', email: 'test@example.com')),
    ],
  );
}
'''),
          const DocHeading('Integration Testing'),
          const DocParagraph(
            'Integration tests focus on testing how different parts of the application work together. In F3 Stack, this typically means testing:',
          ),
          const DocList([
            'User flows (e.g., registration, login)',
            'Data persistence',
            'Navigation between screens',
            'Integration with Firebase services',
          ]),
          const DocCodeBlock('''
// Example of an integration test for a login flow
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:my_f3_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Login Flow Test', () {
    testWidgets('User can log in and see home screen', (WidgetTester tester) async {
      // Start the app
      app.main();
      await tester.pumpAndSettle();

      // Navigate to login screen (if not already there)
      if (find.text('Login').evaluate().isEmpty) {
        await tester.tap(find.byIcon(Icons.account_circle));
        await tester.pumpAndSettle();
      }

      // Enter credentials
      await tester.enterText(find.byType(TextFormField).at(0), 'test@example.com');
      await tester.enterText(find.byType(TextFormField).at(1), 'password123');
      
      // Submit the form
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      // Verify that we're on the home screen
      expect(find.text('Welcome'), findsOneWidget);
    });
  });
}
'''),
          const DocHeading('Golden Tests'),
          const DocParagraph(
            'Golden tests are a form of visual regression testing that compares the rendered UI with a saved "golden" image. This helps ensure that UI changes are intentional and don\tt break the design.',
          ),
          const DocCodeBlock('''
// Example of a golden test for a button
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:my_f3_app/presentation/widgets/custom_button.dart';

void main() {
  testGoldens('CustomButton renders correctly', (tester) async {
    await loadAppFonts();
    
    final builder = DeviceBuilder()
      ..addScenario(
        widget: const CustomButton(
          label: 'Press Me',
          onPressed: null,
        ),
        name: 'disabled',
      )
      ..addScenario(
        widget: const CustomButton(
          label: 'Press Me',
          onPressed: () {},
        ),
        name: 'enabled',
      );

    await tester.pumpDeviceBuilder(builder);
    await screenMatchesGolden(tester, 'custom_button');
  });
}
'''),
          const DocHeading('Test Directory Structure'),
          const DocParagraph(
            'F3 Stack organizes tests in a way that mirrors the main project structure:',
          ),
          const DocCodeBlock('''
test/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
├── presentation/
│   ├── blocs/
│   ├── pages/
│   └── widgets/
└── integration_test/
    └── app_test.dart
'''),
          const DocHeading('Running Tests'),
          const DocParagraph('You can run tests using the following commands:'),
          const DocCodeBlock('''
# Run all unit and widget tests
flutter test

# Run a specific test file
flutter test test/domain/usecases/get_user_test.dart

# Run integration tests
flutter test integration_test/app_test.dart
'''),
          const DocHeading('Best Practices'),
          const DocParagraph(
            'When writing tests for your F3 Stack application, follow these best practices:',
          ),
          const DocList([
            'Test one thing at a time: Each test should focus on a single aspect of functionality.',
            'Use descriptive test names: Test names should clearly describe what is being tested.',
            'Follow the AAA pattern: Arrange, Act, Assert - set up the test, perform the action, verify the result.',
            'Mock external dependencies: Use mocks to isolate the code being tested from external dependencies.',
            'Test edge cases: Consider error conditions, empty states, and boundary values.',
            'Keep tests independent: Tests should not depend on the state from previous tests.',
          ]),
          const DocHeading('Next Steps'),
          const DocParagraph(
            'Now that you understand testing in F3 Stack, you can explore:',
          ),
          isWideScreen
              ? Column(
                children: [
                  Row(
                    children: [
                      DocLink('Deployemnt', '/docs/deployment'),
                      const Text(
                        ' - Learn how to deploy your F3 Stack application',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      DocLink('Dependency Overrides', '/docs/dependency'),
                      const Text(
                        ' - Understand how dependency overrides affect testing',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      DocLink('CLI', '/docs/overview'),
                      const Text(
                        ' - Learn how the F3 CLI can help with testing setup',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              )
              : Column(
                children: [
                  Row(
                    children: [
                      DocLink('Deployemnt', '/docs/deployment'),
                      const Text(
                        ' - Learn how to deploy your F3 Stack application',
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      DocLink('Dependency Overrides', '/docs/dependency'),
                      const Text(
                        ' - Understand how dependency overrides affect testing',
                        style: TextStyle(fontSize: 8.5),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      DocLink('CLI', '/docs/overview'),
                      const Text(
                        ' - Learn how the F3 CLI can help with testing setup',
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
        ],
      ),
    );
  }
}
