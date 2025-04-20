import 'package:f3_docs/features/docs/widgets/nav_link.dart';
import 'package:f3_docs/main.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:go_router/go_router.dart';

class DocsSidebar extends StatefulWidget {
  const DocsSidebar({super.key});

  @override
  State<DocsSidebar> createState() => _DocsSidebarState();
}

class _DocsSidebarState extends State<DocsSidebar> {
  String currentPath = '';

  @override
  void initState() {
    super.initState();
    routeObserver.addListener(_updatePath);
  }

  @override
  void dispose() {
    routeObserver.removeListener(_updatePath);
    super.dispose();
  }

  void _updatePath() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final router = GoRouter.of(context).routerDelegate.currentConfiguration;
        final location = router.fullPath;
        setState(() {
          currentPath = location;
        });
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final router = GoRouter.of(context).routerDelegate.currentConfiguration;
    final location = router.fullPath;
    setState(() {
      currentPath = location;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  child: Image.asset('assets/images/logo.png', scale: 20),
                ),
                const SizedBox(width: 8),
                Text('F3 Stack', style: ShadTheme.of(context).textTheme.h3),
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
                      '/docs',
                      isActive: currentPath == '/docs',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: NavLink(
                      'Installation',
                      '/installation',
                      isActive: currentPath == '/installation',
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
                      '/flutter',
                      isActive: currentPath == '/flutter',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: NavLink(
                      'Firebase',
                      '/firebase',
                      isActive: currentPath == '/firebase',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: NavLink(
                      'Freezed',
                      '/freezed',
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
                      '/overview',
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
                      '/dependency',
                      isActive: currentPath == '/dependency',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: NavLink(
                      'Testing',
                      '/testing',
                      isActive: currentPath == '/testing',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: NavLink(
                      'Deployment',
                      '/deploy',
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
