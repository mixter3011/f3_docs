import 'package:f3_docs/core/utils/toggle_theme.dart';
import 'package:f3_docs/features/docs/screens/architecture.dart';
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
import 'package:flutter/foundation.dart';
import 'package:f3_docs/core/navigation/browser_history_manager.dart';
import 'package:f3_docs/core/navigation/route_notifier.dart';

final F3RouteObserver routeObserver = F3RouteObserver();

void main() {
  final routeNotifier = RouteNotifier();

  final router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    observers: [routeObserver],
    redirect: (context, state) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        routeNotifier.updatePath(state.fullPath ?? '/');
      });
      return null;
    },
    routes: [
      GoRoute(path: '/', builder: (context, state) => const LandingPage()),
      ShellRoute(
        builder: (context, state, child) {
          return DocsLayout(child: child);
        },
        routes: [
          GoRoute(
            path: '/docs/intro',
            builder: (context, state) => const IntroductionPage(),
          ),
          GoRoute(
            path: '/docs/installation',
            builder: (context, state) => const InstallationPage(),
          ),
          GoRoute(
            path: '/docs/architecture',
            builder: (context, state) => const ArchitecturePage(),
          ),
          GoRoute(
            path: '/docs/flutter',
            builder: (context, state) => const FlutterPage(),
          ),
          GoRoute(
            path: '/docs/firebase',
            builder: (context, state) => const FirebasePage(),
          ),
          GoRoute(
            path: '/docs/freezed',
            builder: (context, state) => const FreezedPage(),
          ),
          GoRoute(
            path: '/docs/overview',
            builder: (context, state) => const OverviewPage(),
          ),
          GoRoute(
            path: '/docs/dependency',
            builder: (context, state) => const DependencyPage(),
          ),
          GoRoute(
            path: '/docs/testing',
            builder: (context, state) => const TestingPage(),
          ),
          GoRoute(
            path: '/docs/deploy',
            builder: (context, state) => const DeploymentPage(),
          ),
          GoRoute(path: '/docs', redirect: (_, __) => '/docs/intro'),
        ],
      ),
    ],
  );

  if (kIsWeb) {
    BrowserHistoryManager(router);
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider.value(value: routeNotifier),
      ],
      child: MyApp(router: router),
    ),
  );
}

class MyApp extends StatelessWidget {
  final GoRouter router;

  const MyApp({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
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
