import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DocSubheading extends StatelessWidget {
  final String text;

  const DocSubheading(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(text, style: ShadTheme.of(context).textTheme.h3),
    );
  }
}
