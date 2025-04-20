import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DocTitle extends StatelessWidget {
  final String text;

  const DocTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(text, style: ShadTheme.of(context).textTheme.h1Large),
    );
  }
}
