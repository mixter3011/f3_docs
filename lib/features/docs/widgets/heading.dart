import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DocHeading extends StatelessWidget {
  final String text;
  final double topPadding;

  const DocHeading(this.text, {this.topPadding = 24, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: topPadding, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text, style: ShadTheme.of(context).textTheme.h2),
          const SizedBox(height: 4),
          const Divider(),
        ],
      ),
    );
  }
}
