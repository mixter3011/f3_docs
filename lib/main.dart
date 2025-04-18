import 'package:f3_docs/core/utils/toggle_theme.dart';
import 'package:f3_docs/features/landing/screens/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

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
        return MaterialApp(
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
          home: Builder(
            builder: (context) {
              return ShadApp(
                debugShowCheckedModeBanner: false,
                darkTheme: ShadThemeData(
                  brightness: Brightness.dark,
                  colorScheme: const ShadSlateColorScheme.dark(),
                ),
                home: const LandingPage(),
              );
            },
          ),
          routes: {
            '/docs/introduction': (context) => const Placeholder(),
            '/docs/installation': (context) => const Placeholder(),
            '/docs/flutter': (context) => const Placeholder(),
            '/docs/firebase': (context) => const Placeholder(),
            '/docs/freezed': (context) => const Placeholder(),
            '/docs/faq': (context) => const Placeholder(),
          },
        );
      },
    );
  }
}
