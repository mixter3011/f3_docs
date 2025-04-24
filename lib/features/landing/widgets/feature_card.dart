import 'package:flutter/material.dart';
import 'package:f3_docs/features/landing/widgets/stack_card.dart';

class FeatureCards extends StatelessWidget {
  const FeatureCards({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool istab =
            constraints.maxWidth >= 600 && constraints.maxWidth < 900;
        final bool isdesktop = constraints.maxWidth >= 900;

        return isdesktop
            ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _build(context),
            )
            : istab
            ? Wrap(spacing: 16, runSpacing: 16, children: _build(context))
            : Column(children: _build(context));
      },
    );
  }

  List<Widget> _build(BuildContext context) {
    final double cardWidth = 320;
    final double cardHeight = 340;

    final cards = [
      StackCard(
        title: 'Flutter',
        description:
            "Google's UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.",
        gradientColors: [Colors.blue.shade500, Colors.cyan.shade500],
        route: '/docs/flutter',
        backgroundImage: 'assets/images/flutter.png',
      ),
      StackCard(
        title: 'Firebase',
        description:
            "Google's platform for building mobile and web applications, with pre-configured authentication to get you started quickly.",
        gradientColors: [Colors.orange.shade500, Colors.amber.shade500],
        route: '/docs/firebase',
        backgroundImage: 'assets/images/firebase.png',
      ),
      StackCard(
        title: 'Freezed',
        description:
            "Code generation for immutable classes with unions/pattern-matching/copy for Dart, ensuring type safety throughout your application.",
        gradientColors: [Colors.cyan.shade500, Colors.blue.shade500],
        route: '/docs/freezed',
        backgroundImage: 'assets/images/dart.png',
      ),
    ];
    if (MediaQuery.of(context).size.width >= 768) {
      return cards
          .map(
            (card) => Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(height: cardHeight, child: card),
              ),
            ),
          )
          .toList();
    } else {
      return cards
          .map(
            (card) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: SizedBox(
                width: cardWidth,
                height: cardHeight,
                child: card,
              ),
            ),
          )
          .toList();
    }
  }
}
