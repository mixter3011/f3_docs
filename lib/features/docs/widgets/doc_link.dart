import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class DocLink extends StatelessWidget {
  final String text;
  final String url;

  const DocLink(this.text, this.url, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).go(url);
      },
      child: Text(text, style: ShadTheme.of(context).textTheme.muted),
    );
  }
}
