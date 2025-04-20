import 'package:f3_docs/features/landing/widgets/block.dart';
import 'package:f3_docs/features/landing/widgets/content.dart';
import 'package:f3_docs/features/landing/widgets/feature_card.dart';
import 'package:f3_docs/features/landing/widgets/footer.dart';
import 'package:f3_docs/features/landing/widgets/grids.dart';
import 'package:f3_docs/features/landing/widgets/header.dart';
import 'package:f3_docs/features/landing/widgets/social_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool copied = false;

  void copy() {
    Clipboard.setData(
      const ClipboardData(
        text: "go install github.com/yourusername/f3-stack@latest",
      ),
    );
    setState(() {
      copied = true;
    });
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          copied = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth >= 768;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF1F2937), Colors.black],
              ),
            ),
          ),

          Positioned.fill(
            child: Opacity(opacity: 0.02, child: CustomPaint(painter: Grid())),
          ),

          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SiteHeader(isHomePage: true),

                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: isWideScreen ? 30 : 48,
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(
                              width: isWideScreen ? 700 : null,
                              child: Column(
                                children: [
                                  Text(
                                    'The best way to start a',
                                    style:
                                        ShadTheme.of(context).textTheme.h1Large,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ShaderMask(
                                        shaderCallback:
                                            (bounds) => const LinearGradient(
                                              colors: [
                                                Colors.blue,
                                                Colors.cyan,
                                              ],
                                            ).createShader(bounds),
                                        child: Text(
                                          'full-stack',
                                          style:
                                              ShadTheme.of(
                                                context,
                                              ).textTheme.h1Large,
                                        ),
                                      ),
                                      Text(
                                        ',',
                                        style:
                                            ShadTheme.of(
                                              context,
                                            ).textTheme.h1Large,
                                      ),
                                      const SizedBox(width: 8),
                                      ShaderMask(
                                        shaderCallback:
                                            (bounds) => const LinearGradient(
                                              colors: [
                                                Colors.purple,
                                                Colors.indigo,
                                              ],
                                            ).createShader(bounds),
                                        child: Text(
                                          'typesafe',
                                          style:
                                              ShadTheme.of(
                                                context,
                                              ).textTheme.h1Large,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ShaderMask(
                                        shaderCallback:
                                            (bounds) => const LinearGradient(
                                              colors: [
                                                Colors.deepPurple,
                                                Colors.pink,
                                              ],
                                            ).createShader(bounds),
                                        child: Text(
                                          'Flutter',
                                          style:
                                              ShadTheme.of(
                                                context,
                                              ).textTheme.h1Large,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        'app',
                                        style:
                                            ShadTheme.of(
                                              context,
                                            ).textTheme.h1Large,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: isWideScreen ? 700 : null,
                              child: Text(
                                'F3 Stack combines Flutter, Firebase, and Freezed to provide a robust foundation for building full-stack, type-safe applications with a modular architecture.',
                                style: ShadTheme.of(context).textTheme.lead,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(height: 48),
                            Wrap(
                              spacing: 16,
                              runSpacing: 16,
                              alignment: WrapAlignment.center,
                              children: [
                                ShadButton(
                                  onPressed: () => context.go('/docs'),
                                  gradient: const LinearGradient(
                                    colors: [Colors.cyan, Colors.indigo],
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Colors.blue.withOpacity(.4),
                                      spreadRadius: 4,
                                      blurRadius: 10,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                  child: Text('Documentation'),
                                ),
                                ShadButton.outline(
                                  leading: Image.asset(
                                    '/Users/sen/Desktop/vscode/flutter/projects/f3_docs/assets/images/github-icon.png',
                                  ),
                                  child: Text('GithHub'),
                                ),
                              ],
                            ),
                            const SizedBox(height: 48),
                            Container(
                              width: isWideScreen ? 600 : double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade800.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.grey.shade700),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                      left: 24,
                                      bottom: 10,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          'go  install  github.com/mixter3011/f3-stack@latest',
                                          style:
                                              ShadTheme.of(context).textTheme.p,
                                        ),
                                        const SizedBox(width: 140),
                                        IconButton(
                                          icon: Icon(
                                            copied ? Icons.check : Icons.copy,
                                            color:
                                                copied
                                                    ? Colors.green
                                                    : Colors.grey.shade400,
                                          ),
                                          onPressed: copy,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 80,
                      ),
                      child: Center(
                        child: SizedBox(
                          width: 1100,
                          child:
                              isWideScreen
                                  ? Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(child: Content()),
                                      const SizedBox(width: 64),
                                      Expanded(child: CodeBlock()),
                                    ],
                                  )
                                  : Column(
                                    children: [
                                      Content(),
                                      const SizedBox(height: 32),
                                      CodeBlock(),
                                    ],
                                  ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 40,
                      ),
                      child: Center(
                        child: SizedBox(
                          width: 1100,
                          child: Column(
                            children: [
                              Text(
                                'The F3 Stack',
                                style: ShadTheme.of(context).textTheme.h1Large,
                              ),
                              const SizedBox(height: 48),
                              const FeatureCards(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 80,
                      ),
                      child: Center(
                        child: SizedBox(
                          width: 800,
                          child: Column(
                            children: [
                              Text(
                                'Community',
                                style: ShadTheme.of(context).textTheme.h1Large,
                              ),
                              const SizedBox(height: 24),
                              Text(
                                'Join our community to get help, share your projects, and even contribute to the project!',
                                style: ShadTheme.of(context).textTheme.large,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 48),
                              SocialCard(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Footer(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
