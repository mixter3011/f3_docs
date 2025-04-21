import 'package:f3_docs/features/docs/widgets/doc_list.dart';
import 'package:f3_docs/features/docs/widgets/heading.dart';
import 'package:f3_docs/features/docs/widgets/paragraph.dart';
import 'package:f3_docs/features/docs/widgets/sub_heading.dart';
import 'package:f3_docs/features/docs/widgets/title.dart';
import 'package:f3_docs/features/docs/widgets/code_block.dart';
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

        const DocSubheading('State Management'),
        const DocParagraph(
          'F3 Stack uses the BLoC (Business Logic Component) pattern for state management. This provides a clean separation between UI and business logic, making your code more testable and maintainable.',
        ),

        const DocCodeBlock('''
// Example of a BLoC in F3 Stack
@freezed
class AuthState with _\$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated(User user) = _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.error(String message) = _Error;
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.map(
        signIn: (e) async => await _onSignIn(e, emit),
        signOut: (e) async => await _onSignOut(e, emit),
        checkAuth: (e) async => await _onCheckAuth(e, emit),
      );
    });
  }

  Future<void> _onSignIn(SignIn event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    try {
      final user = await _authRepository.signIn(
        email: event.email,
        password: event.password,
      );
      emit(AuthState.authenticated(user));
    } catch (e) {
      emit(AuthState.error(e.toString()));
    }
  }

  // Other event handlers...
}
'''),

        const DocSubheading('Navigation'),
        const DocParagraph(
          'F3 Stack uses Flutter\'s Navigator 2.0 for declarative routing, with a custom router implementation that makes it easy to define and navigate between routes.',
        ),

        const DocCodeBlock('''
// Example of route definitions in F3 Stack
class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomePage(),
      ),
      // Other routes...
    ],
    errorBuilder: (context, state) => const NotFoundPage(),
  );
}
'''),

        const DocHeading('Best Practices'),
        const DocParagraph(
          'When working with Flutter in F3 Stack, follow these best practices:',
        ),

        const DocList([
          'Keep widgets small and focused: Each widget should have a single responsibility.',
          'Use const constructors: This improves performance by allowing Flutter to reuse widget instances.',
          'Separate business logic from UI: Use BLoCs to manage state and keep UI widgets simple.',
          'Use named routes: This makes navigation more maintainable and easier to understand.',
          'Follow the CLEAN Architecture pattern: Keep your code organized and maintainable.',
        ]),
      ],
    );
  }
}
