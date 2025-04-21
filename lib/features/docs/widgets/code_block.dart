import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DocCodeBlock extends StatelessWidget {
  final String code;

  const DocCodeBlock(this.code, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
      ),
      width: double.infinity,
      child: SelectableText(code, style: ShadTheme.of(context).textTheme.muted),
    );
  }
}
