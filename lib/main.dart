import 'package:f3_docs/core/utils/toggle_theme.dart';
import 'package:f3_docs/features/docs/screens/dependency.dart';
import 'package:f3_docs/features/docs/screens/deployment.dart';
import 'package:f3_docs/features/docs/screens/firebase.dart';
import 'package:f3_docs/features/docs/screens/flutter.dart';
import 'package:f3_docs/features/docs/screens/freezed.dart';
import 'package:f3_docs/features/docs/screens/installation.dart';
import 'package:f3_docs/features/docs/screens/intro.dart';
import 'package:f3_docs/features/docs/screens/layout.dart';
import 'package:f3_docs/features/docs/screens/overview.dart';
import 'package:f3_docs/features/docs/screens/testing.dart';
import 'package:f3_docs/features/docs/widgets/observer.dart';
import 'package:f3_docs/features/landing/screens/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:go_router/go_router.dart';

final F3RouteObserver routeObserver = F3RouteObserver();

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        final router = GoRouter(
          initialLocation: '/',
          debugLogDiagnostics: true,
          observers: [routeObserver],
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const LandingPage(),
            ),
            ShellRoute(
              builder: (context, state, child) {
                return DocsLayout(child: child);
              },
              routes: [
                GoRoute(
                  path: '/docs',
                  builder: (context, state) => const IntroductionPage(),
                ),
                GoRoute(
                  path: '/installation',
                  builder: (context, state) => const InstallationPage(),
                ),
                GoRoute(
                  path: '/flutter',
                  builder: (context, state) => const FlutterPage(),
                ),
                GoRoute(
                  path: '/firebase',
                  builder: (context, state) => const FirebasePage(),
                ),
                GoRoute(
                  path: '/freezed',
                  builder: (context, state) => const FreezedPage(),
                ),
                GoRoute(
                  path: '/overview',
                  builder: (context, state) => const OverviewPage(),
                ),
                GoRoute(
                  path: '/dependency',
                  builder: (context, state) => const DependencyPage(),
                ),
                GoRoute(
                  path: '/testing',
                  builder: (context, state) => const TestingPage(),
                ),
                GoRoute(
                  path: '/deploy',
                  builder: (context, state) => const DeploymentPage(),
                ),
              ],
            ),
          ],
        );

        return ShadApp(
          debugShowCheckedModeBanner: false,
          darkTheme: ShadThemeData(
            brightness: Brightness.dark,
            colorScheme: const ShadSlateColorScheme.dark(),
          ),
          home: Builder(
            builder: (context) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                themeMode: themeProvider.themeMode,
                theme: ThemeData(
                  brightness: Brightness.light,
                  primarySwatch: Colors.blue,
                  scaffoldBackgroundColor: Colors.white,
                  fontFamily: 'Inter',
                ),
                darkTheme: ThemeData(
                  brightness: Brightness.dark,
                  primarySwatch: Colors.blue,
                  scaffoldBackgroundColor: const Color(0xFF121212),
                  fontFamily: 'Inter',
                ),
                routerConfig: router,
              );
            },
          ),
        );
      },
    );
  }
}
