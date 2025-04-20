import 'package:flutter/material.dart';

class DeploymentPage extends StatelessWidget {
  const DeploymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Deployment', style: Theme.of(context).textTheme.headlineLarge),
        const SizedBox(height: 20),
        Text(
          'Learn how to deploy your F3 application to various platforms.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 40),
        const Text(
          'This page contains information about deploying your Flutter Firebase Freezed application.',
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
