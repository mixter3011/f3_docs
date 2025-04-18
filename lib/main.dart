import 'package:f3_docs/core/constants/routes.dart';
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
        return ShadApp(
          debugShowCheckedModeBanner: false,
          darkTheme: ShadThemeData(
            brightness: Brightness.dark,
            colorScheme: const ShadSlateColorScheme.dark(),
          ),
          home: Builder(
            builder: (context) {
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
                home: const LandingPage(),
                routes: AppRoutes.routes,
              );
            },
          ),
        );
      },
    );
  }
}
