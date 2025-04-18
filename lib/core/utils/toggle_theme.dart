import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  void setTheme(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}

class ThemeToggle extends StatelessWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return PopupMenuButton<ThemeMode>(
          icon: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedOpacity(
                opacity:
                    themeProvider.themeMode == ThemeMode.light ||
                            (themeProvider.themeMode == ThemeMode.system &&
                                MediaQuery.platformBrightnessOf(context) ==
                                    Brightness.light)
                        ? 1.0
                        : 0.0,
                duration: const Duration(milliseconds: 200),
                child: const Icon(Icons.wb_sunny_outlined),
              ),
              AnimatedOpacity(
                opacity:
                    themeProvider.themeMode == ThemeMode.dark ||
                            (themeProvider.themeMode == ThemeMode.system &&
                                MediaQuery.platformBrightnessOf(context) ==
                                    Brightness.dark)
                        ? 1.0
                        : 0.0,
                duration: const Duration(milliseconds: 200),
                child: const Icon(Icons.nightlight_round),
              ),
            ],
          ),
          onSelected: (ThemeMode mode) {
            themeProvider.setTheme(mode);
          },
          itemBuilder:
              (context) => [
                PopupMenuItem<ThemeMode>(
                  value: ThemeMode.light,
                  child: Row(
                    children: [
                      Icon(
                        Icons.wb_sunny_outlined,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      const SizedBox(width: 8),
                      const Text('Light'),
                    ],
                  ),
                ),
                PopupMenuItem<ThemeMode>(
                  value: ThemeMode.dark,
                  child: Row(
                    children: [
                      Icon(
                        Icons.nightlight_round,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      const SizedBox(width: 8),
                      const Text('Dark'),
                    ],
                  ),
                ),
                PopupMenuItem<ThemeMode>(
                  value: ThemeMode.system,
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings_outlined,
                        color: Theme.of(context).iconTheme.color,
                      ),
                      const SizedBox(width: 8),
                      const Text('System'),
                    ],
                  ),
                ),
              ],
        );
      },
    );
  }
}
