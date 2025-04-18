import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Typesafe From The Start',
          style: ShadTheme.of(context).textTheme.h2,
        ),
        const SizedBox(height: 24),
        Text(
          'We made F3 Stack to do one thing: Streamline the setup of typesafe Flutter apps WITHOUT compromising modularity.',
          style: ShadTheme.of(context).textTheme.lead,
        ),
        const SizedBox(height: 24),
        Text(
          'By leveraging Freezed for immutable data models and pattern matching, your application benefits from compile-time type checking, reducing runtime errors and making your code more robust.',
          style: ShadTheme.of(context).textTheme.lead,
        ),
        const SizedBox(height: 24),
        InkWell(
          onTap: () {},
          child: Row(
            children: [
              Text(
                'Learn more about typesafety in F3 Stack',
                style: ShadTheme.of(context).textTheme.blockquote,
              ),
              const SizedBox(width: 8),
              Icon(Icons.arrow_forward, size: 16, color: Colors.blue.shade400),
            ],
          ),
        ),
        const SizedBox(height: 48),
        Text('Authentication Ready', style: ShadTheme.of(context).textTheme.h2),
        const SizedBox(height: 24),
        Text(
          'Stop wasting time setting up basic authentication flows. F3 Stack scaffolds a complete auth system that works out of the box.',
          style: ShadTheme.of(context).textTheme.lead,
        ),
        const SizedBox(height: 24),
        Text(
          'With built-in boilerplate for authentication, you can focus on your app\'s unique features instead of reinventing the wheel for login, registration, and user management.',
          style: ShadTheme.of(context).textTheme.lead,
        ),
        const SizedBox(height: 24),
        InkWell(
          onTap: () {},
          child: Row(
            children: [
              Text(
                'Explore authentication features',
                style: ShadTheme.of(context).textTheme.blockquote,
              ),
              const SizedBox(width: 8),
              Icon(Icons.arrow_forward, size: 16, color: Colors.blue.shade400),
            ],
          ),
        ),
      ],
    );
  }
}
