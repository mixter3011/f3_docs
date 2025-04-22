import 'package:f3_docs/features/docs/widgets/nav_link.dart';
import 'package:f3_docs/core/navigation/route_notifier.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:provider/provider.dart';

class DocsSidebar extends StatelessWidget {
  const DocsSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    final routeNotifier = Provider.of<RouteNotifier>(context);
    final currentPath = routeNotifier.currentPath;

    return Container(
      width: 250,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border(
          right: BorderSide(
            color:
                Theme.of(context).brightness == Brightness.dark
                    ? Colors.white.withOpacity(0.1)
                    : Colors.grey.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Image.asset('assets/images/logo.png', scale: 15),
                ),
                const SizedBox(width: 2),
                Text('Stack', style: ShadTheme.of(context).textTheme.h3),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              children: [
                _build(context, 'Getting Started', [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: NavLink(
                      'Introduction',
                      '/docs/intro',
                      isActive: currentPath == '/docs',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: NavLink(
                      'Installation',
                      '/docs/installation',
                      isActive: currentPath == '/installation',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: NavLink(
                      'Architecture',
                      '/docs/architecture',
                      isActive: currentPath == '/architecture',
                    ),
                  ),
                ]),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(color: Colors.white, thickness: 0.2),
                ),
                _build(context, 'Core Concepts', [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: NavLink(
                      'Flutter',
                      '/docs/flutter',
                      isActive: currentPath == '/flutter',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: NavLink(
                      'Firebase',
                      '/docs/firebase',
                      isActive: currentPath == '/firebase',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: NavLink(
                      'Freezed',
                      '/docs/freezed',
                      isActive: currentPath == '/freezed',
                    ),
                  ),
                ]),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(color: Colors.white, thickness: 0.2),
                ),
                _build(context, 'CLI', [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: NavLink(
                      'Overview',
                      '/docs/overview',
                      isActive: currentPath == '/overview',
                    ),
                  ),
                ]),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(color: Colors.white, thickness: 0.2),
                ),
                _build(context, 'Advanced', [
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: NavLink(
                      'Dependency Overrides',
                      '/docs/dependency',
                      isActive: currentPath == '/dependency',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: NavLink(
                      'Testing',
                      '/docs/testing',
                      isActive: currentPath == '/testing',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: NavLink(
                      'Deployment',
                      '/docs/deploy',
                      isActive: currentPath == '/deploy',
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _build(BuildContext context, String title, List<Widget> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
          child: Text(
            title,
            style: ShadTheme.of(
              context,
            ).textTheme.large.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        ...links,
      ],
    );
  }
}
