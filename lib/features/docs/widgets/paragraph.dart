import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DocParagraph extends StatelessWidget {
  final String text;

  const DocParagraph(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(text, style: ShadTheme.of(context).textTheme.p),
    );
  }
}
