import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SiteHeader extends StatefulWidget {
  final bool isHomePage;

  const SiteHeader({super.key, this.isHomePage = false});

  @override
  State<SiteHeader> createState() => _SiteHeaderState();
}

class _SiteHeaderState extends State<SiteHeader> {
  bool isMenuOpen = false;

  void toggleMenu() {
    setState(() {
      isMenuOpen = !isMenuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final navigation = [
      {'name': 'Docs', 'route': '/docs/introduction'},
      {'name': 'FAQ', 'route': '/docs/faq'},
    ];

    return Container(
      color:
          widget.isHomePage
              ? Colors.transparent
              : Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
      child: Column(
        children: [
          Container(
            height: 64,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, '/'),
                      child: Image.asset('assets/images/logo.png', scale: 15),
                    ),
                    const SizedBox(width: 10),
                    MediaQuery.of(context).size.width > 768
                        ? Row(
                          children:
                              navigation
                                  .map(
                                    (item) => Padding(
                                      padding: const EdgeInsets.only(right: 24),
                                      child: InkWell(
                                        onTap:
                                            () => Navigator.pushNamed(
                                              context,
                                              item['route']!,
                                            ),
                                        child: Text(
                                          item['name']!,
                                          style:
                                              ShadTheme.of(
                                                context,
                                              ).textTheme.lead,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                        )
                        : const SizedBox(),
                  ],
                ),
                Row(
                  children: [
                    if (MediaQuery.of(context).size.width > 768) ...[
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 12,
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.star_border_rounded, size: 22),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.brightness_4, size: 18),
                        onPressed: () {},
                      ),
                    ],
                    if (MediaQuery.of(context).size.width <= 768)
                      IconButton(
                        icon: Icon(isMenuOpen ? Icons.close : Icons.menu),
                        onPressed: toggleMenu,
                      ),
                  ],
                ),
              ],
            ),
          ),
          if (isMenuOpen && MediaQuery.of(context).size.width <= 768)
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...navigation
                      .map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, item['route']!);
                              toggleMenu();
                            },
                            child: Text(
                              item['name']!,
                              style: ShadTheme.of(context).textTheme.lead,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.star_outline, size: 16),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.brightness_4),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
