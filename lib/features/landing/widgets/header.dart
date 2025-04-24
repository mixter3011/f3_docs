import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width - 15, 0);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width - 15, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class SiteHeader extends StatefulWidget {
  final bool isHomePage;

  const SiteHeader({super.key, this.isHomePage = false});

  @override
  State<SiteHeader> createState() => _SiteHeaderState();
}

class _SiteHeaderState extends State<SiteHeader> {
  bool isMenuOpen = false;

  void toggleMenu({bool close = false}) {
    setState(() {
      isMenuOpen = close ? false : !isMenuOpen;
    });
  }

  Future<void> _launch() async {
    const url = 'https://github.com/mixter3011/f3-stack.git';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
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
                      child: Image.asset('assets/images/logo.png', scale: 10),
                    ),
                    const SizedBox(width: 14),
                    MediaQuery.of(context).size.width > 768
                        ? Row(
                          children:
                              navigation
                                  .map(
                                    (item) => Padding(
                                      padding: const EdgeInsets.only(right: 24),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                            context,
                                            item['route']!,
                                          );
                                          toggleMenu(close: true);
                                        },
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
                      Row(
                        children: [
                          InkWell(
                            onTap: _launch,
                            child: ClipPath(
                              clipper: Clipper(),
                              child: Container(
                                height: 36,
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width > 400
                                          ? 12
                                          : 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.star_border_rounded,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      'Give a star over Github !',
                                      style:
                                          ShadTheme.of(context).textTheme.lead,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          InkWell(
                            onTap: _launch,
                            child: Container(
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                color: const Color(0xFF252A37),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/images/github-icon.png',
                                  width: 32,
                                  height: 32,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
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
                        onTap: _launch,
                        child: ClipPath(
                          clipper: Clipper(),
                          child: Container(
                            height: 36,
                            padding: const EdgeInsets.only(left: 12, right: 24),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star_border_rounded,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                const SizedBox(width: 6),
                                const Text(
                                  'Give a star over Github !',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: _launch,
                        child: Container(
                          height: 36,
                          width: 36,
                          decoration: BoxDecoration(
                            color: const Color(0xFF252A37),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/images/github-icon.png',
                              width: 32,
                              height: 32,
                              color: Colors.white,
                            ),
                          ),
                        ),
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
