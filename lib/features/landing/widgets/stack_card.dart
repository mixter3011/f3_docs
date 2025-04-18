import 'package:flutter/material.dart';

class StackCard extends StatelessWidget {
  final String title;
  final String description;
  final List<Color> gradientColors;
  final String route;

  const StackCard({
    super.key,
    required this.title,
    required this.description,
    required this.gradientColors,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => {},
      onExit: (_) => {},
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade800.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade700),
        ),
        padding: const EdgeInsets.all(24),
        constraints: BoxConstraints(minHeight: 250),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: gradientColors,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                title[0],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            Flexible(
              fit: FlexFit.loose,
              child: Text(
                description,
                style: TextStyle(fontSize: 16, color: Colors.grey.shade400),
              ),
            ),
            const SizedBox(height: 24),
            InkWell(
              onTap: () => Navigator.pushNamed(context, route),
              child: Row(
                children: [
                  Text(
                    'Learn more',
                    style: TextStyle(color: Colors.blue.shade400, fontSize: 16),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward,
                    size: 16,
                    color: Colors.blue.shade400,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
