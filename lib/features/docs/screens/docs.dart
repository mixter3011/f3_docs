import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Docs extends StatelessWidget {
  const Docs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Docs !', style: ShadTheme.of(context).textTheme.h1Large),
      ),
    );
  }
}
