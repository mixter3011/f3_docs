import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final String description;

  const FeatureCard({
    required this.title,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white),
            ),
            child: const Icon(Icons.check, color: Colors.white, size: 16),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: ShadTheme.of(context).textTheme.large),
                const SizedBox(height: 4),
                Text(description, style: ShadTheme.of(context).textTheme.p),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
