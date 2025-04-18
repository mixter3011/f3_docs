import 'package:f3_docs/features/landing/widgets/block.dart';
import 'package:f3_docs/features/landing/widgets/content.dart';
import 'package:f3_docs/features/landing/widgets/footer.dart';
import 'package:f3_docs/features/landing/widgets/header.dart';
import 'package:f3_docs/features/landing/widgets/stack_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool copied = false;

  void copyCommand() {
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
            child: Opacity(
              opacity: 0.02,
              child: CustomPaint(painter: GridPainter()),
            ),
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
                                          onPressed: copyCommand,
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
                        vertical: 80,
                      ),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey.shade800),
                        ),
                      ),
                      child: Center(
                        child: SizedBox(
                          width: 1100,
                          child: Column(
                            children: [
                              const Text(
                                'The F3 Stack',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 48),
                              LayoutBuilder(
                                builder: (context, constraints) {
                                  return constraints.maxWidth >= 768
                                      ? Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: _buildStackCards(),
                                      )
                                      : Column(children: _buildStackCards());
                                },
                              ),
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
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey.shade800),
                        ),
                      ),
                      child: Center(
                        child: SizedBox(
                          width: 800,
                          child: Column(
                            children: [
                              const Text(
                                'Get Started in Minutes',
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 24),
                              Text(
                                'Create a new F3 Stack project with a single command and start building your application right away.',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey.shade400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 48),
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade800.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 12,
                                            height: 12,
                                            decoration: const BoxDecoration(
                                              color: Colors.red,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Container(
                                            width: 12,
                                            height: 12,
                                            decoration: const BoxDecoration(
                                              color: Colors.amber,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Container(
                                            width: 12,
                                            height: 12,
                                            decoration: const BoxDecoration(
                                              color: Colors.green,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8,
                                      ),

                                      child: Text(
                                        '# Install the F3 CLI\ngo install github.com/yourusername/f3-stack@latest\n\n# Create a new project\nf3-stack create\n\n# Follow the prompts to configure your project\n# Connect to Firebase\nflutterfire configure',
                                        style: TextStyle(
                                          fontFamily: 'monospace',
                                          fontSize: 14,
                                          color: Colors.grey.shade300,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 24),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue.shade600,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 24,
                                    vertical: 16,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text('View Installation Guide'),
                                    SizedBox(width: 8),
                                    Icon(Icons.arrow_forward, size: 16),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const SiteFooter(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildStackCards() {
    final cards = [
      StackCard(
        title: 'Flutter',
        description:
            "Google's UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.",
        gradientColors: [Colors.blue.shade500, Colors.cyan.shade500],
        route: '/docs/flutter',
      ),
      StackCard(
        title: 'Firebase',
        description:
            "Google's platform for building mobile and web applications, with pre-configured authentication to get you started quickly.",
        gradientColors: [Colors.orange.shade500, Colors.amber.shade500],
        route: '/docs/firebase',
      ),
      StackCard(
        title: 'Freezed',
        description:
            "Code generation for immutable classes with unions/pattern-matching/copy for Dart, ensuring type safety.",
        gradientColors: [Colors.purple.shade500, Colors.pink.shade500],
        route: '/docs/freezed',
      ),
    ];

    if (MediaQuery.of(context).size.width >= 768) {
      return cards
          .map(
            (card) => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: card,
              ),
            ),
          )
          .toList();
    } else {
      return cards
          .map(
            (card) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: card,
            ),
          )
          .toList();
    }
  }
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.white
          ..strokeWidth = 1;

    const double gridSize = 50;

    for (double i = 0; i <= size.width; i += gridSize) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }

    for (double i = 0; i <= size.height; i += gridSize) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
