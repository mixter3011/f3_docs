import 'package:f3_docs/features/landing/widgets/stack_card.dart';
import 'package:flutter/material.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return constraints.maxWidth >= 768
            ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _build(context),
            )
            : Column(children: _build(context));
      },
    );
  }

  List<Widget> _build(BuildContext context) {
    final double cardWidth = 320;
    final double cardHeight = 340;

    final cards = [
      StackCard(
        title: 'GitHub',
        description:
            "Contribute to the project by submitting issues, and pull requests on our GitHub repository.",
        gradientColors: [Colors.grey.shade100, Colors.black],
        url: 'https://github.com/mixter3011/f3_docs.git',
        backgroundImage: 'assets/images/github-icon.png',
      ),
      StackCard(
        title: 'Twitter',
        description: "Join us on Twitter for shitposts.",
        gradientColors: [Colors.grey.shade300, Colors.black],
        url: 'https://x.com/f3stack',
        backgroundImage: 'assets/images/x.jpg',
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
